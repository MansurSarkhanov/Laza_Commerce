import 'package:flutter/material.dart';
import 'package:laza_commerce/Core/Service/firebase_service.dart';
import 'package:laza_commerce/Core/Service/firebase_storage_service.dart';

import '../../Components/Buttons/auth_button.dart';
import '../../Components/Inputs/custom_textfield.dart';
import '../../Components/remember_me.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  TextEditingController passController = TextEditingController();

  final provider = FirebaseService();
  final storage = FirebaseStorageService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AuthButton(
        onTap: () {
          storage.uploadImage();
          // provider.signUpUser(
          // email: emailController.text,
          // password: passController.text,
          // username: usernameController.text);
        },
        buttonText: "Sign Up",
        provider: provider,
      ),
      body: SingleChildScrollView(
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
                  "Sign Up",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        storage.pickImage();
                      },
                      child: Container(
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
                    const RememberMe()
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
