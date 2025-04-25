import 'dart:math';

import 'package:auth_demo/core/resources/color_manger.dart';
import 'package:auth_demo/core/resources/font_manger.dart';
import 'package:auth_demo/core/resources/show_error_dialog%20.dart';
import 'package:auth_demo/core/resources/values_manger.dart';
import 'package:auth_demo/presentation/widget/button_auth.dart';
import 'package:auth_demo/presentation/widget/page_title.dart';
import 'package:auth_demo/presentation/widget/social_icons.dart';
import 'package:auth_demo/presentation/widget/text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).pushNamedAndRemoveUntil("Home", (routes) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Center(
                child: CircleAvatar(
                  radius: 40,
                  child: Image.asset("assets/images/log_auth.png"),
                ),
              ),
              const SizedBox(height: 15),
              const UpperTextPage(
                textOne: "Login",
                textTwo: "Login to continue using the app",
              ),
              CustomTextFormField(
                hinttext: "Enter your email",
                mycontroller: email,
                label: const Text("Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email can't be empty";
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                hinttext: "Enter your password",
                mycontroller: password,
                label: const Text("password"),
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password can't be empty";
                  }
                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p20),
                  child: InkWell(
                    onTap: () async {
                      if (email.text.isEmpty) {
                        showErrorDialog(context, "Email can't be empty");
                        return;
                      }
                      try {
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email.text.trim());
                        showErrorDialog(context,
                            "Password reset email sent to ${email.text.trim()}");
                      } catch (e) {
                        showErrorDialog(context, e.toString());
                      }
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                          color: ColorsManger.greyHint, fontSize: FontSize.s15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ButtonAuth(
                title: "Login",
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email.text.trim(),
                              password: password.text.trim());

                      print(" Login Success: ${credential.user?.email}");

                      if (credential.user != null) {
                        Navigator.pushReplacementNamed(context, 'Home');
                      }
                    } on FirebaseAuthException catch (e) {
                      print("FirebaseAuthException: ${e.code}");

                      if (e.code == 'user-not-found') {
                        showErrorDialog(
                            context, 'No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        showErrorDialog(
                            context, 'Wrong password provided for that user.');
                      } else {
                        showErrorDialog(
                            context, 'Something went wrong. Please try again.');
                      }
                    } catch (e) {
                      print("Unknown error: $e");
                    }
                  } else {
                    print("Not Valid");
                  }
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      indent: 20,
                      endIndent: 10,
                      thickness: 1,
                      color: ColorsManger.greyHint,
                    ),
                  ),
                  Text("Or Login With",
                      style: TextStyle(
                          color: ColorsManger.greyHint,
                          fontSize: FontSize.s15)),
                  Expanded(
                    child: Divider(
                      indent: 10,
                      endIndent: 20,
                      thickness: 1,
                      color: ColorsManger.greyHint,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: Row(
                  children: [
                    const Spacer(),
                    SocialIcons(
                      icon: Icons.facebook,
                      color: ColorsManger.blue,
                      onPressed: () {},
                    ),
                    const Spacer(),
                    SocialIcons(
                      icon: Icons.apple,
                      color: ColorsManger.black,
                      onPressed: () {},
                    ),
                    const Spacer(),
                    SocialIcons(
                      icon: Icons.android,
                      color: ColorsManger.green,
                      onPressed: () {
                        signInWithGoogle();
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'Register');
                },
                child: const Center(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "Don't have an account ? ",
                    ),
                    TextSpan(
                        text: "Register",
                        style: TextStyle(
                            color: ColorsManger.blue,
                            fontWeight: FontWeight.bold)),
                  ])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
