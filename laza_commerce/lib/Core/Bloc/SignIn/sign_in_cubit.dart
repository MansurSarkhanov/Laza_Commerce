import 'package:bloc/bloc.dart';

import '../../Data/Repository/impl_auth_repository.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  final _authRepository = ImplAuthRepository();
  bool isLoading = false;
  Future<void> signInGoogle() async {
    isLoading = true;
    emit(SignInProgress());
    final result = await _authRepository.signInWithGoogle();
    if (result.isSuccess()) {
      isLoading = false;
      emit(SignInSuccess());
    } else if (result.isError()) {
      final response = result.tryGetError();
      isLoading = false;
      emit(SignInFailure(message: response!.message));
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    isLoading = true;

    emit(SignInProgress());
    final result = await _authRepository.signInUser(email: email, password: password);
    if (result.isSuccess()) {
      isLoading = false;

      emit(SignInSuccess());
    } else if (result.isError()) {
      final response = result.tryGetError();
      isLoading = false;

      emit(SignInFailure(message: response!.message));
    }
  }

}
