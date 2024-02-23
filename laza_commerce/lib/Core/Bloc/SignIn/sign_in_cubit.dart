import 'package:bloc/bloc.dart';

import '../../Data/Repository/impl_auth_repository.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  final authRepository = ImplAuthRepository();
  bool isLoading = false;
  Future<void> signInGoogle() async {
    isLoading = true;

    emit(SignInProgress());
    final result = await authRepository.signInWithGoogle();
    if (result.isSuccess()) {
      print('sdf');
      isLoading = false;

      emit(SignInSuccess());
    } else if (result.isError()) {
      final response = result.tryGetError();
      emit(SignInFailure(message: response!.message));
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    isLoading = true;

    emit(SignInProgress());
    final result = await authRepository.signInUser(email: email, password: password);
    if (result.isSuccess()) {
      isLoading = false;

      emit(SignInSuccess());
    } else if (result.isError()) {
      final response = result.tryGetError();
      emit(SignInFailure(message: response!.message));
    }
  }
}
