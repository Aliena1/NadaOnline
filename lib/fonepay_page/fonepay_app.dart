import 'dart:async';
import 'package:fonepay_flutter/fonepay_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';

class FonePayApp extends StatefulWidget {
  const FonePayApp({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FonePayApp> createState() => _FonePayAppState();
}

class _FonePayAppState extends State<FonePayApp> {
  String refId = '';
  String hasError = '';

  @override
  void initState() {
    super.initState();
    // _listenToDeepLinks();
  }


  @override
  Widget build(BuildContext context) {
    // Determine screen size
    final screenSize = MediaQuery.of(context).size;
    final isLandscape = screenSize.width > screenSize.height;


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // FonePay Button for Payment
            FonePayButton(
              paymentConfig: FonePayConfig.live(
                  amt: 1.0,
                  r2: 'https://clientapi.fonepay.com/api/merchantRequest',
                  ru: 'https://nada024.laxmihyundai.com/fonepay-response-mobile',
                  r1: 'qwq',
                  prn: 'PD-2-${FonePayUtils.generateRandomString(len: 6)}',
                  sk: '01fc907cb4cf4d4a8c2e6b87deb44189',
                  md: 'S',
                  pid: '2009140171',

              ),
              // width: double.infinity,
              // width: isLandscape ? screenSize.width * 0.6 : screenSize.width * 0.8,
              onFailure: (result) async {
                print('failed...');
                Get.back();
                setState(() {
                  refId = '';
                  hasError = result;
                });
                if (kDebugMode) {
                  print(result);
                }
              },
              onSuccess: (result) async {
                print('success success');
                setState(() {
                  hasError = '';
                  refId = result.uid!;
                });
                if (kDebugMode) {
                  print(result.toJson());
                }
              },
            ),

            // Another Payment Button
            TextButton(
              onPressed: () async {
                final result = await FonePay.i.init(
                  context: context,
                  fonePayConfig: FonePayConfig.dev(
                      amt: 1.0,
                      r2: 'https://clientapi.fonepay.com/api/merchantRequest',
                      ru: 'https://clientapi.fonepay.com/api/merchantRequest',
                      r1: 'qwq',
                      prn: 'PD-2-${FonePayUtils.generateRandomString(len: 6)}',
                      sk: '01fc907cb4cf4d4a8c2e6b87deb44189',
                      md: 'S',
                      pid: '2009140171'
                  ),
                );
                if (result.hasData) {
                  final response = result.data!;
                  setState(() {
                    hasError = '';
                    refId = response.uid!;
                  });
                  if (kDebugMode) {
                    print(response.toJson());
                  }
                } else {
                  print('else ese');
                  Get.back();
                  setState(() {
                    refId = '';
                    hasError = result.error!;
                  });
                  if (kDebugMode) {
                    print(result.error);
                  }
                }
              },
              child: const Text('Pay with FonePay'),
            ),
            if (refId.isNotEmpty)
              Center(
                child: Text(
                  'Console: Payment Success, Ref Id: $refId',
                  textAlign: TextAlign.center,
                ),
              ),
            if (hasError.isNotEmpty)
              Center(
                child: Text(
                  'Console: Payment Failed, Message: $hasError',
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
  //
  // StreamSubscription? _sub;
  //
  // void _listenToDeepLinks() {
  //   _sub = linkStream.listen((String? link) {
  //     if (link != null) {
  //       print('Received deep link: $link');
  //       _handlePaymentResponse(link);
  //     }
  //   });
  // }
  // void _handlePaymentResponse(String link) {
  //   if (link.contains('success')) {
  //     print('Payment was successful!');
  //     // Update your UI or app state
  //   } else if (link.contains('failure')) {
  //     print('Payment failed.');
  //     // Update your UI or app state
  //   }
  // }
  // @override
  // void dispose() {
  //   _sub?.cancel();
  //   super.dispose();
  // }

}
