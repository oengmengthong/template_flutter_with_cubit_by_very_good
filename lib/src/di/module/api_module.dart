import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/network/rest_client.dart';

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
  @singleton
  RestClient restClient(
    @Named('apiUrl') Uri baseUrl,
    @Named('requestTimeout') Duration timeout,
  ) {
    return RestClient(baseUrl.toString())
      ..headers = {
        'Content-Type': 'application/json',
      }
      ..timeout(timeout)
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
}
