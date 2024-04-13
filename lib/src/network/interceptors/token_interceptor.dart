import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../entites/token_type.dart';


class Token {
  final String value;
  final TokenType type;

  Token(this.value, this.type);

  /// Builds the authorization header based on the given token.
  ///
  /// If the token type is [TokenType.bearer], the header will be in the format
  /// "Bearer <token value>". If the token type is [TokenType.basic], the header
  /// will be in the format "Basic <token value>".
  ///
  /// Returns the authorization header as a [String].
  String build() {
    switch (type) {
      case TokenType.bearer:
        return 'Bearer $value';
      case TokenType.basic:
        return 'Basic $value';
    }
  }
}

/// An interceptor that adds an authorization token to the request headers.
///
/// This interceptor checks if a token is available and adds it to the request headers.
/// If no token is available, the request is passed to the next handler.
///
/// If [_shouldIgnore] returns true for the given [options], the interceptor will ignore the token and
/// proceed with the request without adding the token to the headers. Otherwise, it will add the token
/// to the headers and proceed with the request.
///
/// If the token has expired, the interceptor will attempt to refresh the token using the [refreshToken] function.
/// If the token is successfully refreshed, the interceptor will retry the original request with the new token.
/// If the token refresh fails, the interceptor will pass the error to the next handler.
///
/// The authorization header is built based on the given token. If the token type is [TokenType.bearer], the header
/// will be in the format "Bearer <token value>". If the token type is [TokenType.basic], the header
/// will be in the format "Basic <token value>".

class TokenInterceptor extends QueuedInterceptor {
  TokenInterceptor({
    required this.createClient,
    required this.getToken,
    required this.refreshToken,
    this.log,
    bool Function(RequestOptions options)? shouldIgnore,
    required bool Function(DioException exception) shouldRefresh,
  })  : _shouldIgnore = shouldIgnore,
        _shouldRefresh = shouldRefresh;

  final Dio Function() createClient;
  final Future<Token?> Function() getToken;
  final Future<Token?> Function() refreshToken;
  final void Function(String message)? log;

  bool Function(RequestOptions options)? _shouldIgnore;
  bool Function(DioException exception) _shouldRefresh;

  @visibleForTesting
  set shouldIgnore(bool Function(RequestOptions options)? value) {
    _shouldIgnore = value;
  }

  @visibleForTesting
  set shouldRefresh(bool Function(DioException exception) value) {
    _shouldRefresh = value;
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await getToken();

    /// Checks if a token is available and adds it to the request headers.
    /// If no token is available, the request is passed to the next handler.
    if (token == null) {
      return handler.next(options);
    }

    /// If [_shouldIgnore] returns true for the given [options], the interceptor will ignore the token and
    /// proceed with the request without adding the token to the headers. Otherwise, it will add the token
    /// to the headers and proceed with the request.
    if (_shouldIgnore?.call(options) ?? false) {
      return handler.next(options);
    }

    return handler.next(
      options..headers.addAll({'Authorization': token.build()}),
    );
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final shouldRefresh = _shouldRefresh(err);

    if (shouldRefresh) {
      final requestOptions = err.requestOptions;

      try {
        final authorization = requestOptions.headers['Authorization'] as String;
        final tokenValue = authorization.split(' ').last;
        final token = await getToken();

        /// Token was refreshed by the other request
        if (token!.value != tokenValue) {
          log?.call('Using new token...');

          final client = createClient();
          final originalResult = await client.fetch(
            requestOptions..headers.addAll({'Authorization': token.build()}),
          );

          return handler.resolve(originalResult);
        } else {
          log?.call('Refreshing token...');

          final token = await refreshToken();
          if (token == null) return handler.next(err);

          final client = createClient();
          final originalResult = await client.fetch(
            requestOptions..headers.addAll({'Authorization': token.build()}),
          );

          return handler.resolve(originalResult);
        }
      } catch (e) {
        return handler.reject(err);
      }
    }

    return super.onError(err, handler);
  }
}
