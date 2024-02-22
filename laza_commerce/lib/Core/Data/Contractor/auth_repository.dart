import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../Models/failure_model.dart';

abstract class IAuthRepository {
  Future<Result<User, FailureModel>> signUpUser(
      {required String email, required String username, required String password, required String imageUrl});
}
