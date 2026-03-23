import 'package:flutter/material.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 225, 219, 248),
        border: Border.all(color: Colors.white, width: 1.5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        style: TextStyleWidget.lightTextStyle(16),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          suffixIcon: Container(
            margin: EdgeInsets.all(3),
            width: 80,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.all(10),
            child: Icon(Icons.search, color: Colors.white),
          ),
          hintText: "Search for medicines",
          hintStyle: TextStyleWidget.lightTextStyle(16),
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
