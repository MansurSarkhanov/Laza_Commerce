import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:laza_commerce/Core/Service/firebase_storage_service.dart';
import 'package:laza_commerce/Feature/Animations/bounce_animation.dart';
import 'package:laza_commerce/Product/Constants/app_colors.dart';

import '../../../Core/Bloc/SignUp/sign_up_cubit.dart';
import '../../../Product/Utility/Mixin/signup_state_mixin.dart';
import '../../Components/Buttons/auth_button.dart';
import '../../Components/Inputs/custom_textfield.dart';
import '../Home/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SignUpStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final storage = FirebaseStorageService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AuthButton(
        onTap: () async {
          await storage.uploadImage();
         
          context.read<SignUpCubit>().signUp(
              email: emailController.text,
              password: passController.text,
              usernmae: usernameController.text,
              imageUrl: storage.imageUrl);
        },
        buttonText: "Sign Up",
      ),
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpFailure) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(state.message),
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
                child: BounceFromBottomAnimation(
                  delay: 3,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            context.route.pop();
                          },
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
                        "Sign Up",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () async {
                              await storage.pickImage();

                              setState(() {});
                            },
                            child: storage.selectedFile != null
                                ? Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, border: Border.all(color: AppColors.primaryColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 75,
                                        width: 75,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: MemoryImage(
                                                  storage.selectedImgeByte!,
                                                )),
                                            color: const Color.fromARGB(255, 223, 223, 225),
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 75,
                                    width: 75,
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade300),
                                    child: const Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Icon(
                                        Icons.add_a_photo_outlined,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                          ),
                          CustomTextField(
                            controller: usernameController,
                            labelText: 'Username',
                          ),
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
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
