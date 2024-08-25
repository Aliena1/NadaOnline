import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Loading{
  showLoading([String message="Loading..."]){
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 30),
          child: Row(
            children: [
              SizedBox(
                width: 32,
                height: 32,
                // child: const CircularProgressIndicator(strokeWidth: 3.5,),
                child: Lottie.asset("assets/lottie/loading.json",height: 150),

              ),
              const SizedBox(width: 12,),
              Flexible(
                child: Text(message,style: const TextStyle(
                    fontSize: 16,fontWeight: FontWeight.bold,
                ),),
              ),
            ],
          ),
        ),
      ),
      barrierColor: Colors.white.withOpacity(0.5),
      barrierDismissible: false,
    );

    // Get.defaultDialog(
    //     radius: 3,
    //     title: "",
    //     contentPadding: const EdgeInsets.all(0),
    //     barrierDismissible: false,
    //     content: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         const CircularProgressIndicator(),
    //         const SizedBox(height: 8,),
    //         Text(message,style: TextStyle(
    //             fontSize: Dimensions.height14,fontWeight: FontWeight.w600
    //         ),),
    //       ],
    //     )
    // );
  }

  showLoadingIOS([String message="loading..."]){
    Get.dialog(
      CupertinoAlertDialog(
        content: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CupertinoActivityIndicator(),
              const SizedBox(height: 8,),
              Text(message,style: const TextStyle(
                  fontSize: 14,fontWeight: FontWeight.w600
              ),),
            ],
          ),
        ),
      ),
      barrierColor: Colors.white.withOpacity(0.5),
      barrierDismissible: false,
    );

    // Get.defaultDialog(
    //     radius: 3,
    //     title: "",
    //     contentPadding: const EdgeInsets.all(0),
    //     barrierDismissible: false,
    //     content: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         const CircularProgressIndicator(),
    //         const SizedBox(height: 8,),
    //         Text(message,style: TextStyle(
    //             fontSize: Dimensions.height14,fontWeight: FontWeight.w600
    //         ),),
    //       ],
    //     )
    // );
  }

  void hideLoading(){
    if(Get.isDialogOpen!) Get.back();
  }


}