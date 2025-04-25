import 'package:auth_demo/presentation/pages/add_page.dart';
import 'package:auth_demo/presentation/pages/home_screen.dart';
import 'package:auth_demo/presentation/pages/login_screen.dart';
import 'package:auth_demo/presentation/pages/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(
            '===============================================User is currently signed out!');
      } else {
        print(
            '===============================================User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null
          ? const LoginScreen()
          : const HomeScreen(),
      routes: {
        "Register": (context) => const RegisterScreen(),
        "login": (context) => const LoginScreen(),
        "Home": (context) => const HomeScreen(),
        "add": (context) => const AddPage(),
      },
    );
  }
}
