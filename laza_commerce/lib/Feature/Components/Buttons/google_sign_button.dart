import 'package:flutter/material.dart';
import 'package:laza_commerce/Product/Constants/Paths/icon_path.dart';

class GoogleSignButton extends StatelessWidget {
  const GoogleSignButton({super.key, required this.onPress, required this.isLoading});
  final VoidCallback onPress;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                      IconPath.google.toPathPng(),
                width: 20,
              ),
              const SizedBox(
                width: 4,
              ),
              const Text(
                'Google',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
