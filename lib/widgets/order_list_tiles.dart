
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/utils/constants.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';

class OrderListTiles extends StatelessWidget {
  const OrderListTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 241, 241, 252),
      ),
      child: Row(
        children: [

          //image area
          Container(
            height: 120,
            padding: EdgeInsets.all(10),
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.5),
              gradient: LinearGradient(
                colors: [
                  Color(0xffbab3a6),
                  Color(0xffddd7cd),
                  Color(0xffa59c8f),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(Constants.medicine1, height: 120),
          ),

          Gap(Constants.spaceBwtItems / 1.5),

          //Medicine Details
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  //Medicine Name
                  Text(
                    "Paracitamol",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleWidget.headlineTextStyle(18),
                  ),

                  //quantity
                  RichText(
                    maxLines: 1,
                    text: TextSpan(
                      text: "Quantity:",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: "Poppins-semiBold",
                      ),
                      children: [
                        TextSpan(
                          text: " 5saevresdgregrsgrvrtb",
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),

                  //company name
                  Text(
                    "Company",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleWidget.headlineTextStyle(16),
                  ),

                  //medicine price section
                  RichText(
                    text: TextSpan(
                      text: "Price:",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: "Poppins-semiBold",
                      ),
                      children: [
                        TextSpan(
                          text: " 5",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
