import 'package:firebase_auth/firebase_auth.dart';
import 'package:laza_commerce/Core/Models/user_model.dart';

import '../../Product/Utility/Firebase/firebase_references.dart';

class FirebaseService {
  Future<void> signInUser(String email, String password) async {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    final user = credential.user;
    if (user != null) {
      final userModel =
          UserModel(email: user.email, password: password, uid: user.uid, username: user.displayName).toJson();
      if (userModel.isNotEmpty) {
        final firebaseRef = FirebaseReference.users.ref;
        firebaseRef.doc(user.uid).set(userModel);
      }
    }
  }
}
