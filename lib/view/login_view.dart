import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/controller/auth_controller.dart';
import 'package:pharmacy_app/routes/app_routes.dart';
import 'package:pharmacy_app/utils/constants.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';
import 'package:pharmacy_app/widgets/common_button.dart';
import 'package:pharmacy_app/widgets/common_text_field.dart';

class LoginView extends GetView<AuthController> {
  LoginView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //get the size of the screen
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Stack(
            children: [
              //top container
              Container(
                height: size.height / 2,
                width: size.width,
                decoration: BoxDecoration(
                  color: Color(0xfff7bc3c),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
                child: Column(
                  children: [
                    Gap(Constants.spaceBwtSections * 1.5),
                    //title text
                    Text(
                      "Hello",
                      style: TextStyleWidget.headlineTextStyle(
                        60,
                      ).copyWith(fontFamily: "Fredoka-Bold", height: 0),
                    ),

                    //sub title text
                    Text(
                      "Welcome Back !",
                      style: TextStyleWidget.headlineTextStyle(
                        45,
                      ).copyWith(fontFamily: "Fredoka-light", letterSpacing: 0),
                    ),
                  ],
                ),
              ),

              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUnfocus,
                child: Obx(
                  () => Container(
                    padding: EdgeInsets.all(20),
                    width: size.width,
                    margin: EdgeInsets.only(
                      top: size.height / 3.8,
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 247, 234),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Gap(Constants.spaceBwtSections / 2),

                        //title text
                        Text(
                          "Login Account",
                          style: TextStyleWidget.headlineTextStyle(
                            35,
                          ).copyWith(fontFamily: "Fredoka-Bold"),
                        ),

                        Gap(Constants.spaceBwtItems / 2),

                        //sub title text
                        Text(
                          "Sign in to access your dashboard and continue",
                          textAlign: TextAlign.center,
                          style: TextStyleWidget.lightTextStyle(
                            20,
                          ).copyWith(fontFamily: "Fredoka-Light", height: 0),
                        ),

                        Gap(Constants.spaceBwtSections),

                        //email text field
                        CommonTextField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter your email";
                            } else if (!GetUtils.isEmail(value.trim())) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                          controller: controller.loginEmailController,
                          keyboardType: TextInputType.emailAddress,
                          label: "Email Address",
                          hintText: "Enter your email",
                          prefixIcon: Icon(Icons.email_outlined),
                        ),

                        Gap(Constants.spaceBwtSections),

                        //password text field
                        CommonTextField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter your password";
                            } else if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                          controller: controller.loginPasswordController,
                          keyboardType: TextInputType.text,
                          label: "Password",
                          hintText: "Enter your password",
                          prefixIcon: Icon(Icons.lock_outlined),
                          obscureText: controller.showPassword.value,
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.togglePassword();
                              debugPrint("${controller.showPassword.value}");
                            },
                            icon: controller.showPassword.value
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          ),
                        ),

                        //forgot password text
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyleWidget.lightTextStyle(
                                14,
                              ).copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),

                        Gap(Constants.spaceBwtItems),

                        //login button
                        CommonButton(
                          text: "Login Account",
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              Loader.show(context);
                              await controller.loginUser(
                                email: controller.loginEmailController.text,
                                password:
                                    controller.loginPasswordController.text,
                              );
                              Loader.hide();
                            }
                          },
                        ),

                        Gap(Constants.spaceBwtSections),

                        //create new account text
                        GestureDetector(
                          onTap: () {
                            //reset the form state
                            _formKey.currentState?.reset();

                            //clearing the textfield
                            controller.loginEmailController.clear();
                            controller.loginPasswordController.clear();
                            
                            controller.showPassword.value = true;

                            //navigate to sign up page
                            Get.toNamed(AppRoutes.signUp);
                          },
                          child: Text(
                            "Create New Account",
                            style: TextStyleWidget.lightTextStyle(
                              16,
                            ).copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
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
