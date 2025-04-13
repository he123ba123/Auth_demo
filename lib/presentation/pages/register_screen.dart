import 'package:auth_demo/core/resources/color_manger.dart';
import 'package:auth_demo/presentation/widget/button_auth.dart';
import 'package:auth_demo/presentation/widget/page_title.dart';
import 'package:auth_demo/presentation/widget/text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController confirm = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            textOne: "Register",
            textTwo: "Enter your personal information to register an account",
          ),
          CusstomTextFormField(
            hinttext: "Enter your name",
            mycontroller: name,
            label: const Text("Username"),
            keyboardType: TextInputType.name,
          ),
          CusstomTextFormField(
            hinttext: "Enter your email",
            mycontroller: email,
            label: const Text("Email"),
            keyboardType: TextInputType.emailAddress,
          ),
          CusstomTextFormField(
            hinttext: "Enter your password",
            mycontroller: password,
            label: const Text("password"),
            keyboardType: TextInputType.visiblePassword,
          ),
          CusstomTextFormField(
            hinttext: "Enter confirm password",
            mycontroller: confirm,
            label: const Text("Confirm password"),
            keyboardType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 5),
          ButtonAuth(title: "Register", onPressed: () {}),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'login');
            },
            child: const Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Have an account ? ",
                ),
                TextSpan(
                    text: "Login",
                    style: TextStyle(
                        color: ColorsManger.blue, fontWeight: FontWeight.bold)),
              ])),
            ),
          ),
        ],
      ),
    );
  }
}
