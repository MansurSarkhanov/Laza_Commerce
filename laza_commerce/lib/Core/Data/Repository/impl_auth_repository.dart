import 'package:firebase_auth/firebase_auth.dart';
import 'package:laza_commerce/Core/DI/injection.dart';
import 'package:laza_commerce/Core/Data/Contractor/auth_repository.dart';
import 'package:laza_commerce/Core/Models/failure_model.dart';
import 'package:laza_commerce/Core/Service/firebase_service.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../Product/Utility/Firebase/firebase_references.dart';
import '../../Models/user_model.dart';

class ImplAuthRepository implements IAuthRepository {
  // final _firebaseStorageService = DependencyInjection().getIt.get<FirebaseStorageService>();
  final firebaseService = DependencyInjection().getIt.get<FirebaseService>();
  @override
  Future<Result<User, FailureModel>> signUpUser(
      {required String email, required String username, required String password, required String imageUrl}) async {
    try {
      final user =
          await firebaseService.signUpUser(email: email, password: password, username: username, imageUrl: imageUrl);
      if (user != null) {
        final userModel = UserModel(
          image: imageUrl,
          email: user.email,
          password: password,
          uid: user.uid,
          username: username,
        ).toJson();
        if (userModel.isNotEmpty) {
          final firebaseRef = FirebaseReference.users.ref;
          firebaseRef.doc(user.uid).set(userModel);
        }
      }
      return Success(user!);
    } on FirebaseAuthException catch (e) {
      return Error(FailureModel(message: e.message ?? 'Error'));
    }
  }
}
