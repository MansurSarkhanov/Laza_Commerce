import 'package:flutter/material.dart';

import '../../../Core/Service/firebase_service.dart';
import '../../../Product/Constants/app_colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.provider,
    required this.email,
    required this.password,
    required this.username,
    required this.buttonText,
  });

  final FirebaseService provider;
  final String email;
  final String password;
  final String username;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          provider.signUpUser(
            email: email,
            password: password,
            username: username,
          );
        },
        child: Container(
            color: AppColors.primaryColor,
            height: 75,
            child: Center(
                child: Text(
              buttonText,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
            ))));
  }
}
