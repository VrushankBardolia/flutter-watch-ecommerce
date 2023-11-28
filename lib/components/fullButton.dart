import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxetime/util/theme.dart';

class FullButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const FullButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width,
        height: 60,
        decoration: BoxDecoration(
          color: MyColors.primary,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(
          child: Text(text,
            style: TextStyle(
              fontSize: 18,
              color: MyColors.onPrimary,
              fontWeight: FontWeight.w600
            )
          )
        ),
      ),
    );
  }
}
