import 'package:flutter/widgets.dart';

import 'package:auto_route/auto_route.dart';

import 'package:injectable/injectable.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/routers/app_router.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/routers/guards.dart';

import '../../network/entites/permission_role.dart';

@module
abstract class RoutesModule {
  @singleton
  AppRouter appRouter(RoleGuard roleGuard, List<AutoRoute> routes) {
    return AppRouter(roleGuard: roleGuard, routes: routes);
  }

  List<AutoRoute> get routes {
    return [
      AutoRoute(
        page: CounterRoute.page,
        initial: true,
        path: Navigator.defaultRouteName,
      ),
      RedirectRoute(
        path: '*',
        redirectTo: Navigator.defaultRouteName,
      )
    ];
  }

  @singleton
  RoleGuard get roleGuard {
    return RoleGuard(
      policies: {
        CounterRoute.name: [
          PermissionRole.user,
          PermissionRole.guest,
        ],
      },
    );
  }
}
