import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/controller/product_controller.dart';
import 'package:pharmacy_app/routes/app_routes.dart';
import 'package:pharmacy_app/services/shared_preferences_helper.dart';
import 'package:pharmacy_app/utils/constants.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';
import 'package:pharmacy_app/widgets/users_details_tiles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
      return Scaffold(
      backgroundColor: Constants.backgrondColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //profile page text
              Text(
                "Profile Page",
                style: TextStyleWidget.headlineTextStyle(28),
              ),

              Gap(Constants.spaceBwtSections),

              //user profile
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    Constants.user,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Gap(Constants.spaceBwtSections),

              //users name section
              UserDetailsTiles(
                icon: Icons.person_2_outlined,
                title: "Name",
                titleText: "${SharedPreferencesHelper().getUserName()}",
              ),

              Gap(Constants.spaceBwtItems),

              //users name section
              UserDetailsTiles(
                icon: Icons.email_outlined,
                title: "Email",
                titleText: "${SharedPreferencesHelper().getUserName()}",
              ),

              Gap(Constants.spaceBwtItems),

              //Logout Section
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  onTap: () async {
                    Get.defaultDialog(
                      titlePadding: EdgeInsets.only(top: 10),
                      title: "Warning",
                      content: Column(
                        children: [
                          Icon(Icons.error, color: Colors.red, size: 45),
                          Gap(10),
                          const Text("Are you sure you want to logout?"),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () => Get.back(),
                                  child: const Text("Cancel"),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ), // Space between buttons
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.all(8),
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () async {
                                    Get.back();
                                    Loader.show(context);
                                    await SharedPreferencesHelper()
                                        .deleteUserInfo();
                                    productController.page.value = 0;
                                    Get.offNamedUntil(
                                      AppRoutes.login,
                                      (route) => false,
                                    );
                                    Loader.hide();
                                  },
                                  child: const Text("Yes"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  leading: Icon(Icons.logout_outlined, size: 40),
                  trailing: Icon(Icons.arrow_forward_ios, size: 30),
                  title: Text(
                    "Logout",
                    style: TextStyleWidget.headlineTextStyle(16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
