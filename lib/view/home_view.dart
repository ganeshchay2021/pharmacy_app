import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/controller/auth_controller.dart';
import 'package:pharmacy_app/routes/app_routes.dart';
import 'package:pharmacy_app/utils/constants.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';
import 'package:pharmacy_app/widgets/category.dart';
import 'package:pharmacy_app/widgets/medicine_list.dart';
import 'package:pharmacy_app/widgets/search_field.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgrondColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.only(top: 50, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //user image
              GestureDetector(
                onTap: () {
                  Get.offNamedUntil(AppRoutes.login, (route) => false);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    Constants.user,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Gap(Constants.spaceBwtItems),

              //heading text
              Text(
                "Your Trusted",
                style: TextStyleWidget.headlineTextStyle(20),
              ),

              //light text
              Text(
                "Online Pharmacy",
                style: TextStyleWidget.lightTextStyle(22),
              ),

              Gap(Constants.spaceBwtSections),

              //search field
              SearchField(),

              Gap(Constants.spaceBwtSections),

              //categories list
              Obx(
                () => SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(Constants.categoriesList.length, (
                      index,
                    ) {
                      return GestureDetector(
                        onTap: () {
                          authController.selectedIndex.value = index;
                        },
                        child: Category(
                          title: Constants.categoriesList[index],
                          selectedIndex: authController.selectedIndex.value,
                          index: index,
                        ),
                      );
                    }),
                  ),
                ),
              ),

              Gap(Constants.spaceBwtSections),

              //medicines list
              MedicineList(
                onTap: () {
                  // Handle medicine tap
                  Get.toNamed("/product");
                },
              ),

              MedicineList(
                onTap: () {
                  // Handle medicine tap
                  Get.toNamed("/product");
                },
              ),

              MedicineList(
                onTap: () {
                  // Handle medicine tap
                  Get.toNamed("/product");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
