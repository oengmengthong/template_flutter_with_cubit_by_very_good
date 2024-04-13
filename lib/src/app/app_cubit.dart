import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/data/entites/permission_role.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/feature/auth/cubit/auth_cubit.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/l10n/l10n_cubit.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/network/api_service.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/shared/utils/logger.dart';

class AppState {
  final bool ready;

  AppState({required this.ready});
}

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState(ready: false)) {
    authz = GetIt.I<AuthCubit>();
    l10n = GetIt.I<L10nCubit>();
    _initialize();
  }

  late AuthCubit authz;
  late L10nCubit l10n;

  Future<void> _initialize() async {
    // await GetIt.I<NotificationsManager>().init();

    authz.stream.listen((_) {
      // final role = authz.userRole;
      final role = PermissionRole.user;
      if (role == PermissionRole.guest) {
        // notifications.clear();
      } else {
        // notifications.initialize();
      }
    });

    // await Future.wait([
    //   authz.initialize(),
    //   l10n.initialize(),
    // ]);

    emit(AppState(ready: true));
  }

  Future<void> logOut() async {
    try {
      // clear everything and call logOut before move user to login page
    } catch (e) {
      logger.e(e);
    } finally {
      // await authz.logOut();
      GetIt.I<ApiService>().client.clearStore();
    }
  }
}
