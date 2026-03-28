import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/services/databases.dart';
import 'package:pharmacy_app/widgets/common_snackbar.dart';

class ProductController extends GetxController {
  RxInt page = 0.obs;

  var  allProducts = Rxn<Stream<QuerySnapshot>>();

  Future<void> getProduct({required String category}) async{
    try {
      allProducts.value = await DatabasesMethods().getProduct(category);
    } on FirebaseFirestore catch (e) {
      snackBar(
        msgType: "Error",
        message: e.toString(),
        color: Colors.red,
      );
    }
  }
}
