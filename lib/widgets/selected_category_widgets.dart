import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/controller/admin_comtroller.dart';

import 'package:pharmacy_app/utils/constants.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';

class SelectedCategoryWidgets extends GetView<AdminController> {
  const SelectedCategoryWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Product Category",
          style: TextStyleWidget.lightTextStyle(
            22,
          ).copyWith(fontFamily: "Fredoka-bold"),
        ),

        Gap(Constants.spaceBwtItems / 2),

        //selected category Dropdown Button
        Obx(
          () => Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                items: Constants.categoriesList
                    .map(
                      (item) =>
                          DropdownMenuItem(value: item, child: Text(item)),
                    )
                    .toList(),
                onChanged: (newVvalue) {
                  controller.categoryName.value = newVvalue;
                },
                value: controller.categoryName.value,
                dropdownColor: Colors.white,
                iconSize: 36,
                icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                hint: Text(
                  "Select Category",
                  style: TextStyleWidget.lightTextStyle(
                    18,
                  ).copyWith(color: Colors.grey.shade500),
                ),
              ),
            ),
          ),
        ),

        Gap(Constants.spaceBwtItems),
      ],
    );
  }
}
