import 'package:flutter/material.dart';
import 'package:laza_commerce/Core/Service/firebase_storage_service.dart';

import '../../Components/Buttons/auth_button.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final storage = FirebaseStorageService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: AuthButton(
          onTap: () {},
          buttonText: "Create an Account",
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  const Text(
                    "Let’s Get Started",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/Icons/ic_google.png',
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  'Google',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.grey.shade400),
                      ),
                      TextButton(onPressed: () {}, child: const Text('Signin'))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
