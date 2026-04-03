import 'package:cloud_firestore/cloud_firestore.dart';

class DatabasesMethods {
  //user add on Firebase Database
  Future addUser(Map<String, dynamic> userInfoMap, String id) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  //fetch user from Firebase Database
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String id) async {
    return await FirebaseFirestore.instance.collection("users").doc(id).get();
  }

  //Product add on Firebase Database
  Future addProduct(Map<String, dynamic> productInfoMap) {
    return FirebaseFirestore.instance
        .collection("Products")
        .add(productInfoMap);
  }

  //Product Fetch from Firebase Database
  Stream<QuerySnapshot> getProduct() {
    return FirebaseFirestore.instance.collection("Products").get().asStream();
  }
}
