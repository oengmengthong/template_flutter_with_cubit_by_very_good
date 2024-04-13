import 'package:bloc/bloc.dart';

class AuthCubit extends Cubit<bool> {
  AuthCubit() : super(false);

  void login() => emit(true);
  void logout() => emit(false);
}
