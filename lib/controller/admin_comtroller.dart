import 'package:cloud_firestore/cloud_firestore.dart';
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

  //add product to database
  Future<void> addProduct() async {
    try {
      //product map
      Map<String, dynamic> productInfoMap = {
        "Product Name": productNameController.text.trim(),
        "Product Price": productPriceController.text.trim(),
        "Product Category": categoryName.trim(),
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
      snackBar(msgType: "Error", message: e.toString(), color: Colors.red);
    }
  }
}
