import 'package:flutter/material.dart';
import 'package:laza_commerce/Core/Service/firebase_service.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final provider = FirebaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: emailController,
          ),
          TextField(
            controller: passController,
          ),
          ElevatedButton(
              onPressed: () {
                provider.signInUser(emailController.text, passController.text);
              },
              child: const Text("SignUp"))
        ],
      ),
    );
  }
}
