import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/controller/auth_controller.dart';
import 'package:pharmacy_app/model/product_model.dart';
import 'package:pharmacy_app/services/databases.dart';
import 'package:pharmacy_app/utils/constants.dart';
import 'package:pharmacy_app/widgets/common_snackbar.dart';

class ProductController extends GetxController {
  RxInt page = 0.obs;

  final authC= Get.find<AuthController>();

  RxList<ProductModel> allProducts= <ProductModel>[].obs;

  List<ProductModel> get filteredProducts {
    final product = allProducts;
    int selected = authC.selectedIndex.value;
    String category= Constants.categoriesList[selected];

    if(category=="All Medicines"){
      return product;
    }else{
      return allProducts.where((p) => p.category == category).toList();
    }
  }


  Future<void> getProduct() async{
    try {
      allProducts.bindStream(
        DatabasesMethods().getProduct().map((snapshot) {
          return snapshot.docs.map((doc) {
            return ProductModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
          }).toList();
        }),
      );
    } on FirebaseFirestore catch (e) {
      snackBar(
        msgType: "Error",
        message: e.toString(),
        color: Colors.red,
      );
    }
  }
}
