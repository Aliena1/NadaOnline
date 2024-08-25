import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../account_management/auth_storage/auth_storage_service.dart';

class HelperFunctions {
  static const int TIME_OUT_DURATION = 20;
  // final loginRepo = LoginRepo();
  // final notificationRepo=NotificationRepository();

  void closeKeyboard(context) {
    FocusScope.of(context).unfocus();
  }

  void snackBarCommon(context, String message, int type) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: Lottie.asset(
                  "assets/lottie/${type == 1 ? "success" : "warning"}.json",
                  repeat: false),
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
              child: Text(
                message,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  color: Colors.black
                    ),
              ),
            )
          ],
        )));
  }

}
