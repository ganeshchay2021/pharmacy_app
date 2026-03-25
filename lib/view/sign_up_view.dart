import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/controller/auth_controller.dart';
import 'package:pharmacy_app/utils/constants.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';
import 'package:pharmacy_app/widgets/common_button.dart';
import 'package:pharmacy_app/widgets/common_text_field.dart';

class SignUpView extends GetView<AuthController> {
  SignUpView({super.key});

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
                      "Join Us",
                      style: TextStyleWidget.headlineTextStyle(
                        55,
                      ).copyWith(fontFamily: "Fredoka-Bold", height: 0),
                    ),

                    //sub title text
                    Expanded(
                      child: Text(
                        "Create Free Account",
                        style: TextStyleWidget.headlineTextStyle(35).copyWith(
                          fontFamily: "Fredoka-light",
                          letterSpacing: 0,
                        ),
                      ),
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
                      top: size.height / 4.8,
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 247, 234),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        //title text
                        Text(
                          "Personal Info",
                          style: TextStyleWidget.headlineTextStyle(
                            35,
                          ).copyWith(fontFamily: "Fredoka-Bold"),
                        ),

                        Gap(Constants.spaceBwtItems / 2),

                        //sub title text
                        Text(
                          "Register your account here and continue",
                          textAlign: TextAlign.center,
                          style: TextStyleWidget.lightTextStyle(
                            20,
                          ).copyWith(fontFamily: "Fredoka-Light", height: 0),
                        ),

                        Gap(Constants.spaceBwtSections / 1.5),

                        //name text field
                        CommonTextField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter your name";
                            }
                            return null;
                          },
                          controller: controller.signUpNameController,
                          keyboardType: TextInputType.text,
                          label: "Your Name",
                          hintText: "Your Name",
                          prefixIcon: Icon(Icons.person_outlined),
                        ),

                        Gap(Constants.spaceBwtSections / 2),

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
                          controller: controller.signUpEmailController,
                          keyboardType: TextInputType.emailAddress,
                          label: "Email Address",
                          hintText: "Enter your email",
                          prefixIcon: Icon(Icons.email_outlined),
                        ),

                        Gap(Constants.spaceBwtSections / 2),

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
                          controller: controller.signUpPasswordController,
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

                        Gap(Constants.spaceBwtSections * 1.5),

                        //login button
                        CommonButton(
                          text: "CreateAccount",
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              Loader.show(context);
                              await controller.registerUser();
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
                            controller.signUpEmailController.clear();
                            controller.signUpNameController.clear();
                            controller.signUpPasswordController.clear();
                            controller.showPassword.value = true;

                            //handle back to login page
                            Get.back();
                          },
                          child: Text(
                            "Back to Login",
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
