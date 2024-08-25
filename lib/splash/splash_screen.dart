import 'package:enquiry_form/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/app_color.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashScreenController = Get.put(SplashScreenController());

  @override
  void initState(){
    print('init splash');
    splashScreenController.check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.blueAngel, // Pink
              AppColors.darkPastelBlue, // Pink
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo or branding element
              Image.asset(
                'assets/images/logo/sq-logo.png', // Replace with your logo image
                width: 150,
              ),
              SizedBox(height: 20),
              // Text elements
              Text(
                'Welcome to',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              Text(
                'Your Enquiry App',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
