import 'package:bloc/bloc.dart';

class AuthState {
  final bool isAuthenticated;

  AuthState(this.isAuthenticated);
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(false));

  void logIn() {
    emit(AuthState(true));
  }

  void logOut() {
    emit(AuthState(false));
  }
}
