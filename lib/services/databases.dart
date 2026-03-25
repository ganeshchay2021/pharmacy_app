import 'package:cloud_firestore/cloud_firestore.dart';

class DatabasesMethods {
  Future addUser(Map<String, dynamic> userInfoMap, String id) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String id) async {
    return await FirebaseFirestore.instance.collection("users").doc(id).get();
  }
}
