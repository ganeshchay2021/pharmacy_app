import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pharmacy_app/services/databases.dart';
import 'package:pharmacy_app/widgets/common_snackbar.dart';

class AdminController extends GetxController {
  RxnString categoryName = RxnString();

  //controllers
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();

  // ImagePicker imagePicker = ImagePicker();

  // Rx<File?> image = Rx<File?>(null);

  // //picked image from Gallery
  // Future pickGalleryImage() async {
  //   final XFile? imagePicked = await imagePicker.pickImage(
  //     source: ImageSource.gallery,
  //   );

  //   if (imagePicked != null) {
  //     image.value = File(imagePicked.path);
  //   }
  // }

  // //picked image from Camera
  // Future pickCameraImage() async {
  //   final XFile? imagePicked = await imagePicker.pickImage(
  //     source: ImageSource.camera,
  //   );

  //   if (imagePicked != null) {
  //     image.value = File(imagePicked.path);
  //   }
  // }

  //add product to database
  Future<void> addProduct() async {
    try {
      // 4. Create the map INCLUDING the image URL
      Map<String, dynamic> productInfoMap = {
        "Product Name": productNameController.text.trim(),
        "Product Price": productPriceController.text.trim(),
        "Product Category": categoryName.value, // Added .value for RxString
        "Company Name": companyNameController.text.trim(),
        "Product Description": productDescriptionController.text.trim(),
      };

      //database calling
      await DatabasesMethods().addProduct(productInfoMap);

      //message handle
      snackBar(
        msgType: "Success",
        message: "Product Add Successfully",
        color: Colors.green,
      );

      // clearing all textfield
      productNameController.clear();
      productPriceController.clear();
      companyNameController.clear();
      productDescriptionController.clear();
      categoryName.value = null;
    } on FirebaseException catch (e) {
      //error haldle
      snackBar(
        msgType: "Error",
        message: "Somthing went wrong",
        color: Colors.red,
      );
    }
  }

  //upload image to firebase
  Future<void> uploadImageToFirebase() async {
    try {} on FirebaseException catch (e) {
      snackBar(msgType: "Error", message: e.toString(), color: Colors.red);
    }
  }
}
