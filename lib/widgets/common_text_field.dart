import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/utils/constants.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';

class CommonTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final int? maxLine;
  final Icon? prefixIcon;
  final double? borderRadius;
  final IconButton? suffixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CommonTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.maxLine=1, this.borderRadius=30,
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
          maxLines: maxLine,
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          style: TextStyleWidget.lightTextStyle(18),
          obscureText: obscureText!,
          decoration: InputDecoration(
            hintStyle: TextStyleWidget.lightTextStyle(
              18,
              color: Colors.grey.shade500,
            ),
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ), // Optional: show a red line
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
