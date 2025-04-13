import 'package:auth_demo/core/resources/color_manger.dart';
import 'package:auth_demo/core/resources/font_manger.dart';
import 'package:auth_demo/core/resources/values_manger.dart';
import 'package:flutter/material.dart';

class UpperTextPage extends StatelessWidget {
  final String textOne;
  final String textTwo;
  const UpperTextPage(
      {super.key, required this.textOne, required this.textTwo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            textOne,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: FontSize.s30),
          ),
          Text(
            textTwo,
            style: const TextStyle(fontSize: 15, color: ColorsManger.grey),
          ),
        ],
      ),
    );
  }
}
