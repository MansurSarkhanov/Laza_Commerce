import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../Models/failure_model.dart';

abstract class IAuthRepository {
  Future<Result<User, FailureModel>> signUpUser(
      {required String email, required String username, required String password, required String imageUrl});
  Future<Result<User, FailureModel>> signInWithGoogle();
  Future<Result<User, FailureModel>> signInUser({required String email, required String password});
  Future<Result<bool, FailureModel>> checkLogin();
}
