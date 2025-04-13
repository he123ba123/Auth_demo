import 'package:auth_demo/core/resources/color_manger.dart';
import 'package:auth_demo/core/resources/values_manger.dart';
import 'package:flutter/material.dart';

class CusstomTextFormField extends StatelessWidget {
  final String hinttext;
  final Widget label;
  final TextInputType keyboardType;
  final TextEditingController mycontroller;
  const CusstomTextFormField(
      {super.key,
      required this.hinttext,
      required this.mycontroller,
      required this.label,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppPadding.p20,
          right: AppPadding.p20,
          top: AppPadding.p10,
          bottom: AppPadding.p20),
      child: TextFormField(
        controller: mycontroller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(
              color: ColorsManger.grey,
            ),
            label: label,
            filled: true,
            fillColor: ColorsManger.greyBackground,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: ColorsManger.border)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: ColorsManger.grey))),
      ),
    );
  }
}
