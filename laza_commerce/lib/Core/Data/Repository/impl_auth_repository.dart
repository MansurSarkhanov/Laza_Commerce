import 'package:firebase_auth/firebase_auth.dart';
import 'package:laza_commerce/Core/DI/injection.dart';
import 'package:laza_commerce/Core/Data/Cache/cache_manager.dart';
import 'package:laza_commerce/Core/Data/Contractor/auth_repository.dart';
import 'package:laza_commerce/Core/Models/failure_model.dart';
import 'package:laza_commerce/Core/Service/auth_service.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../Product/Utility/Firebase/firebase_references.dart';
import '../../Models/user_model.dart';

class ImplAuthRepository implements IAuthRepository {
  //Create a single object with getit
  final _authService = DependencyInjection().getIt.get<AuthDataService>();
  final _cacheManager = DependencyInjection().getIt.get<CacheManager>();

  @override
  //Create a User
  Future<Result<User, FailureModel>> signUpUser(
      {required String email, required String username, required String password, required String imageUrl}) async {
    try {
      final user =
          await _authService.signUpUser(email: email, password: password, username: username, imageUrl: imageUrl);
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
          final token = user.uid;
          print(token);
          _cacheManager.saveBool(key: 'logged', value: true);
          _cacheManager.saveString(key: 'token', value: token);
        }
      }
      return Success(user!);
    } on FirebaseAuthException catch (e) {
      return Error(FailureModel(message: e.message ?? 'Error'));
    }
  }

  @override
  Future<Result<User, FailureModel>> signInWithGoogle() async {
    try {
      final user = await _authService.googleSignIn();
      if (user != null) {
        final userModel = UserModel(
          image: user.photoURL,
          email: user.email,
          uid: user.uid,
          username: user.displayName,
        ).toJson();
        if (userModel.isNotEmpty) {
          final firebaseRef = FirebaseReference.users.ref;
          firebaseRef.doc(user.uid).set(userModel);
          final token = user.uid;
          print(token);

          _cacheManager.saveBool(key: 'logged', value: true);
          _cacheManager.saveString(key: 'token', value: token);
        }
      }
      return Success(user!);
    } on FirebaseAuthException catch (e) {
      return Error(FailureModel(message: e.message ?? 'Error'));
    }
  }

//Login
  @override
  Future<Result<User, FailureModel>> signInUser({required String email, required String password}) async {
    try {
      final user = await _authService.signInUser(email, password);
      if (user != null) {
        final token = user.uid;
        print(token);
        _cacheManager.saveBool(key: 'logged', value: true);
        _cacheManager.saveString(key: 'token', value: token);
      }

      return Success(user!);
    } on FirebaseAuthException catch (e) {
      return Error(FailureModel(message: e.message ?? "Error"));
    }
  }

//Check user if logged the app
  @override
  Future<Result<bool, FailureModel>> checkLogin() async {
    final authentication = await _cacheManager.readBool(key: 'logged');
    if (authentication != null) {
      return Success(authentication);
    }
    return Error(FailureModel(message: 'Not Auth'));
  }
}
