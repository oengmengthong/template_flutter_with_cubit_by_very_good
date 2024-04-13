import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/network/interceptors/token_interceptor.dart'
    as i;
import 'package:template_flutter_with_cubit_by_very_good/src/network/rest_client.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/shared/utils/logger.dart';

import '../injection.dart';
import 'api_module.dart';

/// This module provides dependencies for the private API client.
///
/// The module provides a named singleton instance of [RestClient] for the private API client.
/// It also provides a named singleton instance of [CacheOptions] for caching API responses.
///
/// The module defines four named getters for the private API base URL, each annotated with a different environment.
/// The base URL is used to construct the [RestClient] instance.
///
/// The module also defines an [Interceptor] implementation, [MerchantInterceptor], which adds the 'Business-Id' header to API requests.
@module
abstract class ApiModule {
  @Named('apiClient')
  @lazySingleton
  RestClient restClient(
    @Named('apiUrl') Uri baseUrl,
    @Named('apiCache') CacheOptions cacheOptions,
    @Named('requestTimeout') Duration timeout,
  ) {
    return RestClient(baseUrl.toString())
      ..headers = {
        'Content-Type': 'application/json',
      }
      ..timeout(timeout)
      ..addInterceptor(TokenInterceptor(baseUrl: baseUrl, timeout: timeout))
      ..addInterceptor(UnauthorizedInterceptor())
      ..setCacheOptions(cacheOptions)
      ..setDebug(kDebugMode)
      ..build();
  }

  @development
  @Named('apiUrl')
  Uri get devBaseUrl {
    return Uri(scheme: 'https', host: 'api-url.com', path: 'api');
  }

  @staging
  @Named('apiUrl')
  Uri get stagingBaseUrl {
    return Uri();
  }

  @production
  @Named('apiUrl')
  Uri get prodBaseUrl {
    return Uri(
      scheme: 'https',
      host: 'prod-api.com',
    );
  }

  @Named('requestTimeout')
  @singleton
  Duration get requestTimeout {
    return kReleaseMode
        ? const Duration(minutes: 3)
        : const Duration(minutes: 1);
  }

  @Named('apiCache')
  @singleton
  CacheOptions cacheOptions() {
    return CacheOptions(
      policy: CachePolicy.forceCache,
      store: MemCacheStore(
        maxSize: 20 * 1024 * 1024, // 20MB
        maxEntrySize: 2 * 1024 * 1024, // 2MB
      ),
      maxStale: const Duration(minutes: 30),
      keyBuilder: (request) => request.uri.toString(),
    );
  }
}

class TokenInterceptor extends i.TokenInterceptor {
  TokenInterceptor({
    required Uri baseUrl,
    required Duration timeout,
  }) : super(
          createClient: () {
            final client = RestClient(baseUrl.toString())
              ..setDebug(kDebugMode)
              ..timeout(timeout)
              ..build();

            return client.dio;
          },
          getToken: () async {
            // final token = await GetIt.I<AuthzRepository>().getAccessToken();
            // return token == null ? null : i.Token(token, TokenType.bearer);
          },
          refreshToken: () async {
            // try {
            //   final credentials =
            //       await GetIt.I<AuthzRepository>().refreshToken();
            //   return i.Token(credentials.accessToken, TokenType.bearer);
            // } catch (e) {
            //   await GetIt.I<AppModel>().logOut();
            //   rethrow;
            // }
          },
          shouldIgnore: (options) {
            return ['/oauth2/token', '/oauth2/revoke'].any(
              (path) => options.uri.path.contains(path),
            );
          },
          shouldRefresh: (err) {
            final statusCode = err.response?.statusCode;
            if (statusCode == 401) return true;

            /// WSO2 API Manager uses a custom www-authenticate header which Dio cannot parse
            /// https://github.com/cfug/dio/issues/219
            return err.type == DioExceptionType.unknown;
          },
          log: (message) => logger.d(message),
        );
}

class UnauthorizedInterceptor extends Interceptor {
  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;
    // Forbidden
    if (statusCode == 403) {
      // GetIt.I<AppModel>().logOut();
      return handler.reject(err);
    }
    return handler.next(err);
  }
}
