import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/routes/app_routes.dart';
import 'package:pharmacy_app/services/databases.dart';
import 'package:pharmacy_app/services/shared_preferences_helper.dart';
import 'package:random_string/random_string.dart';

class AuthController extends GetxController {
  RxInt selectedIndex = 0.obs;
  
  RxBool showPassword = true.obs;

  void togglePassword() {
    showPassword.value = !showPassword.value;
  }

  // Login specific controllers
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  // Sign Up specific controllers
  final TextEditingController signUpNameController = TextEditingController();
  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController signUpPasswordController =
      TextEditingController();

  //register method
  Future<void> registerUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: signUpEmailController.text,
            password: signUpPasswordController.text,
          );

      String id = randomAlphaNumeric(10);

      Map<String, dynamic> userInfoMap = {
        "Name": signUpNameController.text,
        "Email": signUpEmailController.text,
        "Id": id,
      };

      //user info saved in sharedpreference
      await SharedPreferencesHelper().saveUserId(id);
      await SharedPreferencesHelper().saveUserName(signUpNameController.text);
      await SharedPreferencesHelper().saveUserEmail(signUpEmailController.text);

      //User info saved in Firebase Database
      await DatabasesMethods().addUser(userInfoMap, id);

      signUpEmailController.clear();
      signUpNameController.clear();
      signUpPasswordController.clear();

      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          "",
          "",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          titleText: const Text(
            "Success",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          messageText: Text(
            "User Registered Successfully!",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        );
      }
      Get.offNamed(AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        if (!Get.isSnackbarOpen) {
          Get.snackbar(
            "",
            "",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            titleText: const Text(
              "Error",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            messageText: Text(
              "Password is weak",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        }
      } else if (e.code == "email-already-in-use") {
        if (!Get.isSnackbarOpen) {
          Get.snackbar(
            "",
            "",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            titleText: const Text(
              "Error",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            messageText: Text(
              "Account already exist",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        }
      } else {
        if (!Get.isSnackbarOpen) {
          Get.snackbar(
            "",
            "",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            titleText: const Text(
              "Error",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            messageText: Text(
              e.message.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        }
      }
    }
  }

  //login method
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      String uid = userCredential.user!.uid;

      debugPrint("USer Id :--$uid)");

      DocumentSnapshot userDoc = await DatabasesMethods().getUser(uid);

      if (userDoc.exists) {
        Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;

        //Save to SharedPreferences
        await SharedPreferencesHelper().saveUserId(uid);
        await SharedPreferencesHelper().saveUserName(data['Name'] ?? "");
        await SharedPreferencesHelper().saveUserEmail(data['Email'] ?? "");
      }
      loginEmailController.clear();
      loginPasswordController.clear();

      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          "",
          "",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          titleText: const Text(
            "Success",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          messageText: Text(
            "Login Successfully",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        );
      }

      Get.offNamed(AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        if (!Get.isSnackbarOpen) {
          if (!Get.isSnackbarOpen) {
            Get.snackbar(
              "",
              "",
              backgroundColor: Colors.red,
              colorText: Colors.white,
              titleText: const Text(
                "Error",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              messageText: Text(
                "Invalid Credintial",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            );
          }
        }
      } else {
        // Optional: Catch any other Firebase errors
        if (!Get.isSnackbarOpen) {
          Get.snackbar(
            "",
            "",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            titleText: const Text(
              "Error",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            messageText: Text(
              e.message.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        }
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    signUpEmailController.dispose();
    signUpNameController.dispose();
    signUpPasswordController.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
  }
}
