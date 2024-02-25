import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza_commerce/Core/Bloc/Auth/auth_cubit.dart';
import 'package:laza_commerce/Feature/Screens/Home/home_page.dart';
import 'package:laza_commerce/Feature/Screens/Start/start_page.dart';
import 'package:laza_commerce/Product/Constants/app_colors.dart';
import 'package:laza_commerce/Product/Utility/Extension/image_extension.dart';

import '../../../Core/Bloc/SignIn/sign_in_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state == AuthState.intial) {
            return Center(
              child: SvgPicture.asset(ImagePath.logo.toPath()),
            );
          } else if (state == AuthState.auth) {
            return const HomePage();
          } else {
            return BlocProvider<SignInCubit>(
              create: (context) => SignInCubit(),
              child: const StartPage(),
            );
          }
        },
      ),
    );
  }
}
