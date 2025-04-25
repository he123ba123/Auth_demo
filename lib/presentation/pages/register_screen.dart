import 'package:auth_demo/core/resources/color_manger.dart';
import 'package:auth_demo/core/resources/show_error_dialog%20.dart';
import 'package:auth_demo/presentation/widget/button_auth.dart';
import 'package:auth_demo/presentation/widget/page_title.dart';
import 'package:auth_demo/presentation/widget/text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80),
              Center(
                child: CircleAvatar(
                  radius: 40,
                  child: Image.asset("assets/images/log_auth.png"),
                ),
              ),
              const UpperTextPage(
                textOne: "Register",
                textTwo:
                    "Enter your personal information to register an account",
              ),
              CustomTextFormField(
                hinttext: "Enter your name",
                mycontroller: name,
                label: const Text("Username"),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username can't be empty";
                  }
                  return null;
                },
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
              CustomTextFormField(
                hinttext: "Enter confirm password",
                mycontroller: confirm,
                label: const Text("Confirm password"),
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password can't be empty";
                  }
                  return null;
                },
              ),
              ButtonAuth(
                  title: "Register",
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                        );
                        Navigator.pushReplacementNamed(context, 'Home');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                          showErrorDialog(
                              context, 'The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                          showErrorDialog(context,
                              'The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                        showErrorDialog(context, e.toString());
                      }
                    }
                  }),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'login');
                },
                child: const Center(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "Have an account ? ",
                    ),
                    TextSpan(
                        text: "Login",
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
