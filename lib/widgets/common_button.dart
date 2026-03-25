import 'package:flutter/material.dart';
import 'package:pharmacy_app/utils/constants.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CommonButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        splashColor: Constants.backgrondColor.withOpacity(0.7),
        child: Ink(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xfff7bc3c),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyleWidget.lightTextStyle(
                20,
              ).copyWith(fontFamily: "Fredoka-Bold", color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
