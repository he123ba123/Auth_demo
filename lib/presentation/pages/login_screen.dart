import 'package:auth_demo/core/resources/color_manger.dart';
import 'package:auth_demo/core/resources/font_manger.dart';
import 'package:auth_demo/core/resources/values_manger.dart';
import 'package:auth_demo/presentation/widget/button_auth.dart';
import 'package:auth_demo/presentation/widget/page_title.dart';
import 'package:auth_demo/presentation/widget/social_icons.dart';
import 'package:auth_demo/presentation/widget/text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: AppPadding.p20),
              child: Text(
                "Forgot password?",
                style: TextStyle(color: ColorsManger.greyHint, fontSize: FontSize.s15),
              ),
            ),
          ),
          const SizedBox(height: 15),
          ButtonAuth(title: "Login", onPressed: () {}),
          const SizedBox(height: 15),
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
                      color: ColorsManger.greyHint, fontSize: FontSize.s15)),
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
          const SizedBox(height: 30),
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
                  onPressed: () {},
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'Register');
            },
            child: const Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Don't have an account ? ",
                ),
                TextSpan(
                    text: "Register",
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
