import 'package:auth_demo/core/resources/color_manger.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List<DocumentSnapshot> getData = [];
  getDataFromFirebase() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('categories').get();
    getData.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    getDataFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsManger.blue,
        title: const Text("Home Screen",
            style: TextStyle(
                color: ColorsManger.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {
                // google sign out
                GoogleSignIn googleSignIn = GoogleSignIn();
                googleSignIn.disconnect();
                // FirebaseAuth.instance.signOut();
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, "login", (routes) => false);
              },
              icon:
                  const Icon(Icons.logout, color: ColorsManger.white, size: 25))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("add");
        },
        backgroundColor: ColorsManger.blue,
        child: const Icon(
          Icons.add,
          color: ColorsManger.white,
        ),
      ),
      body: isLoading == false
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: getData.length,
              itemBuilder: (context, index) {
                return Card(
                  color: ColorsManger.white,
                  child: Column(
                    children: [
                      Image.asset("assets/images/folder.jpg",
                          height: 120, width: 150),
                      Row(
                        children: [
                          const Spacer(),
                          Text(getData[index]['name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: ColorsManger.blue)),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.info,
                                        title: 'Delete',
                                        desc:
                                            'Are you sure you want to delete this category',
                                        btnOkOnPress: () {
                                          FirebaseFirestore.instance
                                              .collection('categories')
                                              .doc(getData[index].id)
                                              .delete();
                                          getData.removeAt(index);
                                          setState(() {});
                                          Navigator.of(context)
                                              .pushReplacementNamed("Home");
                                        },
                                        btnOkText: "Delete",
                                        btnCancelOnPress: () {},
                                        btnCancelText: "Cancel")
                                    .show();
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: ColorsManger.red,
                              ))
                        ],
                      ),
                    ],
                  ),
                );
              }),
    );
  }
}
