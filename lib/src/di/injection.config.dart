// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i7;

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i10;

import '../l10n/l10n_cubit.dart' as _i11;
import '../network/api_service.dart' as _i12;
import '../network/rest_client.dart' as _i9;
import '../routers/app_router.dart' as _i8;
import '../routers/guards.dart' as _i4;
import '../shared/storage/storage.dart' as _i5;
import 'module/api_module.dart' as _i15;
import 'module/app_module.dart' as _i16;
import 'module/routes_module.dart' as _i14;
import 'module/storage_module.dart' as _i13;

const String _staging = 'staging';
const String _production = 'production';
const String _development = 'development';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    final routesModule = _$RoutesModule();
    final apiModule = _$ApiModule();
    final appModule = _$AppModule();
    gh.factory<String>(() => storageModule.storagePrefixKey);
    gh.factory<List<_i3.AutoRoute>>(() => routesModule.routes);
    gh.singleton<_i4.RoleGuard>(() => routesModule.roleGuard);
    gh.singleton<_i5.Storage>(
      () => storageModule.allPurposedStorage,
      instanceName: 'storage',
    );
    gh.factory<Uri>(
      () => apiModule.stagingBaseUrl,
      instanceName: 'apiUrl',
      registerFor: {_staging},
    );
    await gh.factoryAsync<String>(
      () => appModule.stagingAppVersion,
      instanceName: 'appVersion',
      registerFor: {_staging},
      preResolve: true,
    );
    gh.singleton<_i6.CacheOptions>(
      () => apiModule.cacheOptions(),
      instanceName: 'apiCache',
    );
    gh.singleton<_i5.Storage>(
      () => storageModule.authzStorage,
      instanceName: 'authStorage',
    );
    gh.singleton<Duration>(
      () => apiModule.requestTimeout,
      instanceName: 'requestTimeout',
    );
    gh.factory<_i7.Locale>(
      () => appModule.defaultLocale,
      instanceName: 'defaultLocale',
    );
    gh.singleton<_i8.AppRouter>(() => routesModule.appRouter(
          gh<_i4.RoleGuard>(),
          gh<List<_i3.AutoRoute>>(),
        ));
    gh.lazySingleton<_i9.RestClient>(
      () => apiModule.restClient(
        gh<Uri>(instanceName: 'apiUrl'),
        gh<_i6.CacheOptions>(instanceName: 'apiCache'),
        gh<Duration>(instanceName: 'requestTimeout'),
      ),
      instanceName: 'apiClient',
    );
    gh.factory<_i10.LogPrinter>(
      () => appModule.prodLogPrinter,
      registerFor: {_production},
    );
    gh.factory<_i10.LogPrinter>(
      () => appModule.devLogPrinter,
      registerFor: {
        _development,
        _staging,
      },
    );
    await gh.factoryAsync<String>(
      () => appModule.developmentAppVersion,
      instanceName: 'appVersion',
      registerFor: {_development},
      preResolve: true,
    );
    gh.factory<Uri>(
      () => apiModule.prodBaseUrl,
      instanceName: 'apiUrl',
      registerFor: {_production},
    );
    await gh.factoryAsync<String>(
      () => appModule.prodAppVersion,
      instanceName: 'appVersion',
      registerFor: {_production},
      preResolve: true,
    );
    gh.factory<_i11.L10nCubit>(() => _i11.L10nCubit(
          defaultLocale: gh<_i7.Locale>(instanceName: 'defaultLocale'),
          storage: gh<_i5.Storage>(instanceName: 'storage'),
        ));
    gh.factory<Uri>(
      () => apiModule.devBaseUrl,
      instanceName: 'apiUrl',
      registerFor: {_development},
    );
    gh.singleton<_i12.ApiService>(
        () => _i12.ApiService(gh<_i9.RestClient>(instanceName: 'apiClient')));
    return this;
  }
}

class _$StorageModule extends _i13.StorageModule {}

class _$RoutesModule extends _i14.RoutesModule {}

class _$ApiModule extends _i15.ApiModule {}

class _$AppModule extends _i16.AppModule {}
