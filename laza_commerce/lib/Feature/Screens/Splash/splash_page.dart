import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza_commerce/Product/Constants/app_colors.dart';
import 'package:laza_commerce/Product/Utility/Extension/image_extension.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SvgPicture.asset(ImagePath.logo.toPath()),
      ),
    );
  }
}
