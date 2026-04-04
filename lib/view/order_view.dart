import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/utils/constants.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';
import 'package:pharmacy_app/widgets/order_list_tiles.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgrondColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //order Text
              Text("Order Page", style: TextStyleWidget.headlineTextStyle(28)),

              Gap(Constants.spaceBwtItems),

              //ordered Lists
              OrderListTiles(),

              
            ],
          ),
        ),
      ),
    );
  }
}
