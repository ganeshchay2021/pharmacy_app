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
  Future<Stream<QuerySnapshot>> getProduct(String category) async {
    return FirebaseFirestore.instance
        .collection("Products")
        .where("Product Category", isEqualTo: category)
        .snapshots();
  }
}
