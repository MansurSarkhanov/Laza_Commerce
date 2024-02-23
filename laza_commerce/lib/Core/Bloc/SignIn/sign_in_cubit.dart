import 'package:bloc/bloc.dart';

import '../../Data/Repository/impl_auth_repository.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  final authRepository = ImplAuthRepository();

  Future<void> signInGoogle() async {
    emit(SignInProgress());
    final result = await authRepository.signInWithGoogle();
    if (result.isSuccess()) {
      print('sdf');
      emit(SignInSuccess());
    } else if (result.isError()) {
      final response = result.tryGetError();
      emit(SignInFailure(message: response!.message));
    }
  }
}
