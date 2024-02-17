import 'package:flutter/material.dart';

import '../../../Core/Service/firebase_service.dart';
import '../../../Product/Constants/app_colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.provider,
   
    required this.buttonText,
    required this.onTap,
  });

  final FirebaseService provider;
 
  final String buttonText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
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
