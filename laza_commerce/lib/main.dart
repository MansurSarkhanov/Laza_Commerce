import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_commerce/Core/Bloc/Auth/auth_cubit.dart';
import 'package:laza_commerce/Core/Bloc/Home/home_cubit.dart';
import 'package:laza_commerce/Core/DI/injection.dart';
import 'package:laza_commerce/Core/Provider/home_provider.dart';
import 'package:provider/provider.dart';

import 'Core/Bloc/SignIn/sign_in_cubit.dart';
import 'Core/Bloc/SignUp/sign_up_cubit.dart';
import 'Feature/Screens/Splash/splash_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection().setUp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocProvider(
        create: (context) => SignInCubit(),
        child: BlocProvider(
          create: (context) => AuthCubit()..checkUserLogin(),
          child: BlocProvider(
            create: (context) => HomeCubit(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Laza Commerce App',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const SplashPage(),
            ),
          ),
        ),
      ),
    );
  }
}
