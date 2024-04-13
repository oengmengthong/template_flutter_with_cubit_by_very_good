import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import 'package:template_flutter_with_cubit_by_very_good/src/network/endpoints.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/network/rest_client.dart';

part 'api_service.g.dart';

@RestApi()
@singleton
abstract class PrivateApiService {
  @factoryMethod
  factory PrivateApiService(@Named('apiClient') RestClient client) {
    return _PrivateApiService(client.dio, baseUrl: client.baseUrl);
  }

  @GET(EndPoints.POST_LOGIN)
  Future<bool> login();
}
