import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_commerce/Core/Bloc/SignIn/sign_in_cubit.dart';
import 'package:laza_commerce/Core/Service/firebase_storage_service.dart';
import 'package:laza_commerce/Product/Constants/app_colors.dart';

import '../../../Core/Bloc/SignUp/sign_up_cubit.dart';
import '../../Components/Buttons/auth_button.dart';
import '../../Components/Inputs/custom_textfield.dart';
import '../Home/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final storage = FirebaseStorageService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AuthButton(
        onTap: () {},
        buttonText: "Login",
      ),
      body: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignUpFailure) {
            showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text('sdfsdfs'),
                );
              },
            );
          } else if (state is SignUpSuccess) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const HomePage();
              },
            ));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration:
                              const BoxDecoration(color: Color.fromARGB(255, 223, 223, 225), shape: BoxShape.circle),
                          child: const Padding(
                            padding: EdgeInsets.all(14.0),
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Welcome",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Please enter your data to continue",
                      style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          controller: emailController,
                          labelText: 'Email Address',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          controller: passController,
                          labelText: 'Password',
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Remember me",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 30,
                              width: 45,
                              child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: CupertinoSwitch(
                                      activeColor: AppColors.primaryColor,
                                      value: context.watch<SignUpCubit>().isRemember,
                                      onChanged: (value) {
                                        context.read<SignUpCubit>().rememberMe(value);
                                      })),
                            )
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      "By connecting your account confirm that you agree with our Term and Condition",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade400),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
