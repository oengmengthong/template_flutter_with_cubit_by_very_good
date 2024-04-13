import 'package:bloc/bloc.dart';

import '../../../network/entites/permission_role.dart';

class AuthState {
  final bool isAuthenticated;
  final PermissionRole userRole;

  AuthState(this.isAuthenticated, this.userRole);
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(false, PermissionRole.guest));

  void logIn() {
    emit(AuthState(true, PermissionRole.user ));
  }

  void logOut() {
    emit(AuthState(false, PermissionRole.guest));
  }
}
