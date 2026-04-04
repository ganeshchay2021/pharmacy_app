import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/controller/wallet_controller.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';

class BalanceChoseWidget extends GetView<WalletController> {
  const BalanceChoseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(controller.chooseBalance.length, (index) {
          return GestureDetector(
            onTap: () async {
              Loader.show(context);
              controller.selectedBalance.value = index;
              controller.makePayment(
                context,
                controller.chooseBalance[controller.selectedBalance.value],
              );
              Loader.hide();
            },
            child: Container(
              margin: index == 0
                  ? EdgeInsets.only(left: 20, right: 20)
                  : EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
              child: Text(
                "${controller.chooseBalance[index]}",
                style: TextStyleWidget.headlineTextStyle(
                  20,
                ).copyWith(color: Colors.white),
              ),
            ),
          );
        }),
      ),
    );
  }
}
