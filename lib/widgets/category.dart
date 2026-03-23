import 'package:flutter/material.dart';
import 'package:pharmacy_app/utils/constants.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';

class Category extends StatelessWidget {
  final String title;
  final int index;
  final int selectedIndex;

  const Category({
    super.key,
    required this.title,
    required this.index,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Material(
        elevation: selectedIndex == index ? 3.0 : 0.0,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color:selectedIndex == index ? Colors.black: Constants.backgrondColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            title,
            style: TextStyleWidget.lightTextStyle(
              16,
              color:selectedIndex == index ? Colors.white : Colors.black,
            ).copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
