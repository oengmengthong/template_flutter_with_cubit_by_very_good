import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/feature/counter/counter.dart';
import 'guards.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  AppRouter({
    required this.roleGuard,
    required this.routes,
  });

  final RoleGuard roleGuard;
  void Function()? _authListener;
  // AuthModel get _authz => GetIt.I<AppModel>().authz;
  @override
  final List<AutoRoute> routes;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (await roleGuard.resolve(resolver.route.name)) {
      resolver.next(true);
    } else {
      // if the user is not allowed to access the route, redirect to the LoginRoute
      // resolver.redirect(const LoginRoute());

      _authListener = () async {
        final resolved = await roleGuard.resolve(resolver.route.name);
        if (resolved) {
          router.popUntilRoot();
          resolver.next(true);

          // unsubscribeAuthListener();
        }
      };
      // _authz.addListener(_authListener!);
    }
  }

  // @override
  // void dispose() {
  //   unsubscribeAuthListener();
  //   super.dispose();
  // }

  // void unsubscribeAuthListener() {
  //   if (_authListener != null) {
  //     _authz.removeListener(_authListener!);
  //     _authListener = null;
  //   }
  // }
}
