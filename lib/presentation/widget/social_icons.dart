import 'package:auth_demo/core/resources/color_manger.dart';
import 'package:auth_demo/core/resources/font_manger.dart';
import 'package:flutter/material.dart';

class SocialIcons extends StatelessWidget {
  final IconData? icon;
  final void Function()? onPressed;
  final Color? color;
  const SocialIcons({super.key, this.icon, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: ColorsManger.white,
      child: IconButton(
        icon: Icon(
          icon,
          color: color,
          size: FontSize.s30,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
