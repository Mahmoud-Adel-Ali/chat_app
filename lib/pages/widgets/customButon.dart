// ignore_for_file: must_be_immutable

import 'package:chat_app/constant.dart';
import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  CustomButon({super.key, this.text,this.onTap});
  String? text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50),
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Text(
            text!,
            style:const TextStyle(
              color: kPrimaryColor,
              fontSize: 29,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
