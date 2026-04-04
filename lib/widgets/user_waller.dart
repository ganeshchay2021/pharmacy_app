import 'package:flutter/material.dart';
import 'package:pharmacy_app/utils/constants.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';

class UserWallet extends StatelessWidget {
  const UserWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 241, 241, 252),
      ),
      child: Row(
        children: [
          Image.asset(Constants.wallet, height: 100),
          Expanded(
            child: Column(
              children: [
                //text
                Text(
                  "Your Wallet",
                  style: TextStyleWidget.headlineTextStyle(20),
                ),

                //total balance avaibale
                Text("रु. 200", style: TextStyleWidget.headlineTextStyle(33)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
