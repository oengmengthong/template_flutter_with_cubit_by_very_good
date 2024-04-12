import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// A class representing a REST client for making HTTP requests.
///
/// The [RestClient] class provides methods for configuring the client, setting headers,
/// adding interceptors, and enabling caching.
class RestClient {
  RestClient(this.baseUrl);

  final dio = Dio();
  Map<String, String> headers = {};
  final String baseUrl;

  bool _debug = false;
  CacheOptions? _cacheOptions;

  /// Sets the timeout duration for the HTTP requests.
  ///
  /// The [timeout] parameter specifies the duration after which the request will be considered timed out.
  /// Returns the updated [RestClient] instance.
  RestClient timeout(Duration timeout) {
    dio.options
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;
    return this;
  }

  /// Adds an interceptor to the HTTP client.
  ///
  /// The [interceptor] parameter is an instance of the [Interceptor] class that will be added to the client.
  /// Returns the updated [RestClient] instance.
  RestClient addInterceptor(Interceptor interceptor) {
    dio.interceptors.add(interceptor);
    return this;
  }

  /// Enables or disables debug mode for the HTTP client.
  ///
  /// The [debug] parameter specifies whether debug mode should be enabled or disabled.
  /// Returns the updated [RestClient] instance.
  RestClient setDebug(bool debug) {
    _debug = debug;
    return this;
  }

  /// Sets the cache options for the HTTP client.
  ///
  /// The [options] parameter is an instance of the [CacheOptions] class that specifies the caching options.
  /// Returns the updated [RestClient] instance.
  RestClient setCacheOptions(CacheOptions options) {
    dio.interceptors.add(DioCacheInterceptor(options: options));
    _cacheOptions = options;
    return this;
  }

  /// Sets the Dio instance for the HTTP client.
  ///
  /// The [setter] parameter is a function that takes a [Dio] instance and modifies it.
  /// Returns the updated [RestClient] instance.
  RestClient setDio(void Function(Dio dio) setter) {
    setter(dio);
    return this;
  }

  /// Builds the HTTP client.
  ///
  /// This method applies the configured headers, interceptors, and debug mode to the Dio instance.
  /// Returns the updated [RestClient] instance.
  RestClient build() {
    dio.options.headers.addAll(headers);
    if (_debug) {
      dio.interceptors.add(PrettyDioLogger(
        compact: true,
        requestHeader: true,
        requestBody: true,
      ));
    }
    return this;
  }

  /// Returns the cache options with the "noCache" policy.
  ///
  /// This getter returns a copy of the cache options with the "noCache" policy.
  CacheOptions? get noCache {
    return _cacheOptions?.copyWith(policy: CachePolicy.noCache);
  }

  /// Invalidates the cached responses for a specific path.
  ///
  /// The [path] parameter specifies the path for which the cached responses should be invalidated.
  /// The [queries] parameter is an optional map of query parameters to include in the invalidation.
  /// Returns a [Future] that completes when the invalidation is complete.
  Future<void> invalidateResponse(
    String path, {
    Map<String, String>? queries,
  }) async {
    try {
      return _cacheOptions?.store?.deleteFromPath(
        RegExp(baseUrl + path),
        queryParams: queries,
      );
    } catch (e) {
      log(e.toString());
    }
  }

  /// Clears the entire cache store.
  ///
  /// This method clears all the cached responses stored by the client.
  /// Returns a [Future] that completes when the cache is cleared.
  Future<void> clearStore() async {
    await _cacheOptions?.store?.clean();
  }

  /// Closes the HTTP client.
  ///
  /// This method closes the underlying Dio instance.
  void close() {
    dio.close();
  }
}
