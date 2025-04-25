import 'package:auth_demo/core/resources/color_manger.dart';
import 'package:auth_demo/core/resources/show_error_dialog%20.dart';
import 'package:auth_demo/presentation/widget/text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController usernameController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  CollectionReference categories =
      FirebaseFirestore.instance.collection('categories');

  Future<void> addUser() async {
    // Call the categories's CollectionReference to add a new categories
    try {
      if (formkey.currentState!.validate()) {
        DocumentReference response = await categories.add({
          'name': usernameController.text,
        });
        Navigator.of(context).pushReplacementNamed("Home");
      }
    } catch (e) {
      showErrorDialog(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsManger.blue,
          title: const Text(
            "Add Page",
            style: TextStyle(color: ColorsManger.white),
          ),
        ),
        body: Form(
          key: formkey,
          child: Column(children: [
            CustomTextFormField(
              hinttext: "Enter your name",
              mycontroller: usernameController,
              label: const Text("Username"),
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Username can't be empty";
                }
                return null;
              },
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManger.blue),
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    addUser();
                    usernameController.clear();
                  }
                },
                child: const Text("Add",
                    style: TextStyle(color: ColorsManger.white)))
          ]),
        ));
  }
}
