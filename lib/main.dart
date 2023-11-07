import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frases_argentinas/features/app/instructions/instructions_page.dart';
import 'package:frases_argentinas/features/app/splash_screen/splash_screen.dart';
import 'package:frases_argentinas/features/user_auth/presentation/pages/home_page.dart';
import 'package:frases_argentinas/features/user_auth/presentation/pages/login_page.dart';
import 'package:frases_argentinas/features/user_auth/presentation/pages/signup_page.dart';
import 'package:frases_argentinas/firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
       apiKey: "AIzaSyBlnWgp2J73gesotXA8H3csgJHZURcw5jo",
       appId: "1:1091933963597:web:817403e80deac536d72304", 
       messagingSenderId: "1091933963597",
       projectId: "frases-argentinas-dev")
    );
  } else {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/': (context) => SplashScreen(
          child: LoginPage(),
        ),
        '/login':(context) => LoginPage(),
        '/signUp':(context) => SignUpPage(),
        '/home':(context) => HomePage(),
        '/instructions':(context) => InstructionsPage(),
      },
    );
  }
}
