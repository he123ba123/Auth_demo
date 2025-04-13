import 'package:auth_demo/core/resources/color_manger.dart';
import 'package:auth_demo/core/resources/font_manger.dart';
import 'package:auth_demo/core/resources/values_manger.dart';
import 'package:flutter/material.dart';

class ButtonAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const ButtonAuth({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: MaterialButton(
        height: 55,
        onPressed: onPressed,
        color: ColorsManger.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          30,
        )),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(color: ColorsManger.white, fontSize: FontSize.s20),
        )),
      ),
    );
  }
}
