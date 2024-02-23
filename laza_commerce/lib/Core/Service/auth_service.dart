import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthDataService {
  final _firebaseAuth = FirebaseAuth.instance;
  Future<User?> signUpUser(
      {required String email, required String password, required String username, required String? imageUrl}) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    final user = credential.user;
    return user;
  }

  Future<User?> googleSignIn() async {
    final GoogleSignInAccount? user = await GoogleSignIn().signIn();
    if (user != null) {
      final authUser = await user.authentication;
      final credential = GoogleAuthProvider.credential(accessToken: authUser.accessToken, idToken: authUser.idToken);

      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
      final User? resultUser = userCredential.user;
      return resultUser;
    }
    return null;
  }
}
