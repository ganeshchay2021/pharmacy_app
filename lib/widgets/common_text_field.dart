import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/utils/constants.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';

class CommonTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CommonTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,

    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //label text
        Text(
          label,
          style: TextStyleWidget.lightTextStyle(
            22,
          ).copyWith(fontFamily: "Fredoka-bold"),
        ),

        Gap(Constants.spaceBwtItems / 2),

        //input field
        TextFormField(
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          style: TextStyleWidget.lightTextStyle(18),
          obscureText: obscureText!,
          decoration: InputDecoration(
            helperStyle: TextStyleWidget.lightTextStyle(18),
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ), // Optional: show a red line
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
