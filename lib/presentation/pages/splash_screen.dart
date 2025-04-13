import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:auth_demo/core/resources/color_manger.dart';
import 'package:auth_demo/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          backgroundColor:  ColorsManger.splash,
          splashIconSize: 200,
          duration: 4000,
          pageTransitionType: PageTransitionType.leftToRight,
          splashTransition: SplashTransition.rotationTransition,
          splash: const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/images/log_auth.png'),
          ),
          nextScreen: const LoginScreen()),
    );
  }
}
