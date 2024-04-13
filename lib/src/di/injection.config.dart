// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../network/api_service.dart' as _i7;
import '../network/rest_client.dart' as _i6;
import '../routers/app_router.dart' as _i5;
import '../routers/guards.dart' as _i4;
import 'module/api_module.dart' as _i9;
import 'module/routes_module.dart' as _i8;

const String _staging = 'staging';
const String _production = 'production';
const String _development = 'development';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final routesModule = _$RoutesModule();
    final apiModule = _$ApiModule();
    gh.factory<List<_i3.AutoRoute>>(() => routesModule.routes);
    gh.singleton<_i4.RoleGuard>(() => routesModule.roleGuard);
    gh.factory<Uri>(
      () => apiModule.stagingBaseUrl,
      instanceName: 'apiUrl',
      registerFor: {_staging},
    );
    gh.singleton<Duration>(
      () => apiModule.requestTimeout,
      instanceName: 'requestTimeout',
    );
    gh.singleton<_i5.AppRouter>(() => routesModule.appRouter(
          gh<_i4.RoleGuard>(),
          gh<List<_i3.AutoRoute>>(),
        ));
    gh.singleton<_i6.RestClient>(
      () => apiModule.restClient(
        gh<Uri>(instanceName: 'apiUrl'),
        gh<Duration>(instanceName: 'requestTimeout'),
      ),
      instanceName: 'apiClient',
    );
    gh.factory<Uri>(
      () => apiModule.prodBaseUrl,
      instanceName: 'apiUrl',
      registerFor: {_production},
    );
    gh.factory<Uri>(
      () => apiModule.devBaseUrl,
      instanceName: 'apiUrl',
      registerFor: {_development},
    );
    gh.singleton<_i7.PrivateApiService>(() =>
        _i7.PrivateApiService(gh<_i6.RestClient>(instanceName: 'apiClient')));
    return this;
  }
}

class _$RoutesModule extends _i8.RoutesModule {}

class _$ApiModule extends _i9.ApiModule {}
