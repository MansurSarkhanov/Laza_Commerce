import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laza_commerce/Core/Service/firebase_service.dart';

import '../../Components/Buttons/auth_button.dart';
import '../../Components/Inputs/custom_textfield.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final provider = FirebaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AuthButton(
          buttonText: "Sign Up",
          provider: provider,
          email: emailController.text,
          password: passController.text,
          username: usernameController.text),
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
                          child:
                              FittedBox(fit: BoxFit.fill, child: CupertinoSwitch(value: false, onChanged: (value) {})),
                        )
                      ],
                    )
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
