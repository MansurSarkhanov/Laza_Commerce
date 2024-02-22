import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  Future<User?> signUpUser(
      {required String email, required String password, required String username, required String? imageUrl}) async {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    final user = credential.user;
    return user;

  }
}
