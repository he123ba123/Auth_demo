import 'package:auth_demo/core/resources/color_manger.dart';
import 'package:auth_demo/core/resources/values_manger.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hinttext;
  final Widget label;
  final TextInputType keyboardType;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;
  const CustomTextFormField(
      {super.key,
      required this.hinttext,
      required this.mycontroller,
      required this.label,
      required this.keyboardType,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppPadding.p20,
          right: AppPadding.p20,
          top: AppPadding.p10,
          bottom: AppPadding.p10),
      child: TextFormField(
        validator: validator,
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
