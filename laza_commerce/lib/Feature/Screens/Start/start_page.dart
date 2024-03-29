import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:laza_commerce/Feature/Animations/bounce_animation.dart';
import 'package:laza_commerce/Feature/Screens/SignIn/signin_page.dart';
import 'package:laza_commerce/Feature/Screens/SignUp/signup_page.dart';
import 'package:laza_commerce/Product/Constants/Paths/image_path.dart';
import 'package:laza_commerce/Product/Utility/Controllers/audio_conroller.dart';
import 'package:laza_commerce/Product/Utility/Extension/sound_extension.dart';

import '../../Components/Buttons/auth_button.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: AuthButton(
          onTap: () {
            context.route.navigateToPage(const SignUpPage());
          },
          buttonText: "Create an Account",
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BounceFromBottomAnimation(
            delay: 3,
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const BounceFromBottomAnimation(
                  delay: 3,
                  child: Text(
                    "Let’s Get Started",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(child: BounceFromBottomAnimation(delay: 3, child: Image.asset(ImagePath.startLogo))),
                BounceFromBottomAnimation(
                  delay: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
                      ),
                      TextButton(
                          onPressed: () async {
                            final audio = AudioControllers();
                            await audio.playSound(path: SoundPath.sound.toPathMp3());

                            context.route.navigateToPage(const SignInPage());
                          },
                          child: const Text(
                            'Signin',
                            style: TextStyle(fontSize: 15),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
