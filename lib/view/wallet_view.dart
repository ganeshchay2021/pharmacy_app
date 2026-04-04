import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/controller/wallet_controller.dart';
import 'package:pharmacy_app/utils/constants.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';
import 'package:pharmacy_app/view/balance_chose_widget.dart';
import 'package:pharmacy_app/widgets/common_button.dart';
import 'package:pharmacy_app/widgets/user_waller.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgrondColor,
      body: SafeArea(
        child: Column(
          children: [
            //wallet text
            Container(
              margin: EdgeInsets.only(top: 10, left: 20),
              child: Text(
                "Wallet Page",
                style: TextStyleWidget.headlineTextStyle(28),
              ),
            ),

            Gap(Constants.spaceBwtSections),

            //user wallet and balance section
            UserWallet(),

            Gap(Constants.spaceBwtSections),

            BalanceChoseWidget(),

            Gap(Constants.spaceBwtSections),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: CommonButton(height: 45, text: "Add Money", onTap: () {}),
            ),

            Gap(Constants.spaceBwtSections),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 241, 241, 252),
                ),
                child: Column(
                  children: [
                    //your transactions text
                    Text(
                      "Your Transactions",
                      style: TextStyleWidget.headlineTextStyle(18),
                    ),

                    Gap(Constants.spaceBwtSections / 2),

                    Expanded(
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 20,
                              ),

                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.network(
                                    height: 70,
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvTL5lMqJS4ikpcyOc2MtofTd8MHKZ7_kTiA&s",
                                  ),

                                  Expanded(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      "रु. 200",

                                      style: TextStyleWidget.headlineTextStyle(
                                        18,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 5,
                                    ),

                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade200,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "Credit",
                                      style: TextStyleWidget.lightTextStyle(16),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
