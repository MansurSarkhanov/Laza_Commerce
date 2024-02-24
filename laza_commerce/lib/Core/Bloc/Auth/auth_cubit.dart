import 'package:bloc/bloc.dart';

import '../../Data/Repository/impl_auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.intial);

  final _authRepository = ImplAuthRepository();

  Future<void> checkUserLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    final result = await _authRepository.checkLogin();
    if (result.isSuccess()) {
      final isLogin = result.tryGetSuccess();
      emit((isLogin ?? false) ? AuthState.auth : AuthState.unAuth);
    } else if (result.isError()) {
      emit(AuthState.unAuth);
    }
  }
}
