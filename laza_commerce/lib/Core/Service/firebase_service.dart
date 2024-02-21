import 'package:firebase_auth/firebase_auth.dart';
import 'package:laza_commerce/Core/DI/injection.dart';
import 'package:laza_commerce/Core/Models/user_model.dart';
import 'package:laza_commerce/Core/Service/firebase_storage_service.dart';

import '../../Product/Utility/Firebase/firebase_references.dart';

class FirebaseService {
  final firebaseStorageService = DependencyInjection().getIt.get<FirebaseStorageService>();
  Future<void> signUpUser(
      {required String email, required String password, required String username, required String? imageUrl}) async {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    final user = credential.user;
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
  }
}
