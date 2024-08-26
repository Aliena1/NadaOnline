import 'package:enquiry_form/account_management/screens/login-screen.dart';
import 'package:enquiry_form/booking/model/booking_detail_model/booking_detail_model.dart';
import 'package:enquiry_form/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'home_page/model/enquiry_detail_model/enquiry_detail_model.dart';
import 'home_page/model/enquiry_model.dart';
import 'home_page/model/vehicle_model.dart';

void main() async{
  await GetStorage.init();
  await Hive.initFlutter();
  Hive.registerAdapter(DataAdapter());
  Hive.registerAdapter(CustomerTypeAdapter());
  Hive.registerAdapter(EnquiryTypeAdapter());
  Hive.registerAdapter(PurchaseModeAdapter());
  Hive.registerAdapter(SchemeAdapter());
  Hive.registerAdapter(FinancingBankAdapter());
  Hive.registerAdapter(OccupationAdapter());
  Hive.registerAdapter(VehicleModelAdapter());
  Hive.registerAdapter(VehicleDataAdapter());
  Hive.registerAdapter(VariantAdapter());
  Hive.registerAdapter(SpecificationAdapter());
  Hive.registerAdapter(EnquiryDetailModelAdapter());
  Hive.registerAdapter(EnquiryModelListAdapter());
  Hive.registerAdapter(PurchaseModeListAdapter());
  Hive.registerAdapter(ModelColorAdapter());
  Hive.registerAdapter(BookingDetailModelAdapter());
  Hive.registerAdapter(PurchaseModeListBookingAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  SplashScreen(),
    );
  }
}

