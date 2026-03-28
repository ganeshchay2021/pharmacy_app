import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackBar({required String msgType, required String message, required Color color}) {
  if (!Get.isSnackbarOpen) {
    Get.snackbar(
      "",
      "",
      backgroundColor: color,
      colorText: Colors.white,
      titleText:  Text(
        msgType,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
