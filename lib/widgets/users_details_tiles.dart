import 'package:flutter/material.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';

class UserDetailsTiles extends StatelessWidget {
  final String title;
  final String titleText;
  final IconData icon;
  const UserDetailsTiles({
    super.key,
    required this.icon,

    required this.title,
    required this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(title, style: TextStyleWidget.lightTextStyle(16)),
        subtitle: Text(titleText, style: TextStyleWidget.headlineTextStyle(16)),
      ),
    );
  }
}
