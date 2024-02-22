import 'package:bloc/bloc.dart';

import '../../Data/Repository/impl_auth_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  final authRepository = ImplAuthRepository();
  Future<void> signUp(
      {required String email, required String password, required String usernmae, required String imageUrl}) async {
    emit(SignUpProgress());
    final registerUser =
        await authRepository.signUpUser(email: email, password: password, username: usernmae, imageUrl: imageUrl);
    emit(SignUpSuccess());
  }
}
