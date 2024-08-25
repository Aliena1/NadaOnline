import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';

import '../../common_get_storage/common_storage.dart';


class LocalAuth extends GetxController {


  final LocalAuthentication auth = LocalAuthentication();
  final box = GetStorage();
  Rx<bool> authenticated = false.obs;


  SupportState supportState = SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  @override
  void onInit() {
    print('on init');
    super.onInit();
  }

  Future<void> checkAuthentication() async {
    await auth.isDeviceSupported().then(
          (bool isSupported) =>
      supportState = isSupported
          ? SupportState.supported
          : SupportState.unsupported,
    );
    if (supportState == SupportState.supported) {
      print('device support auth = $supportState');
      _checkBiometrics();
    } else {
      print('device doesn\'t support auth = $supportState');
    }
  }

  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
      print('');
      _getAvailableBiometrics();
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
  }

  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
      print('availableBiometrics - $availableBiometrics');
      // if (availableBiometrics.contains(BiometricType.face)) {
        // _authenticate();
        _authenticateWithBiometrics();
      // }
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      // setState(() {
      _isAuthenticating = true;
      _authorized = 'Authenticating';
      // });
      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      // setState(() {
      _isAuthenticating = false;
      // });
    } on PlatformException catch (e) {
      print(e);

      return;
    }
  }


    Future<void> _authenticateWithBiometrics() async {
      try {
        // setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
        // });
        authenticated.value = await auth.authenticate(
          localizedReason:
          'Scan your fingerprint (or face or whatever) to authenticate',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ),
        );
        print('authenticate status = ${authenticated.value}');
        // box.write('isBiometricEnabled', true);
        StorageService().setValue('isBiometricEnabled', true);

        // setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
        // });
      } on PlatformException catch (e) {
        print(e);
        // setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
        // });
        return;
      }
      final String message = authenticated.value ? 'Authorized' : 'Not Authorized';
      print('get message = $message');
  }

    Future<void> cancelAuthentication() async {
      await auth.stopAuthentication();
      authenticated.value = false;
      // box.write('isBiometricEnabled', false);
      StorageService().setValue('isBiometricEnabled', false);


      // setState(() => _isAuthenticating = false);
    }

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: ListView(
            padding: const EdgeInsets.only(top: 30),
            children: <Widget>[
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     if (_supportState == _SupportState.unknown)
              //       const CircularProgressIndicator()
              //     else if (_supportState == _SupportState.supported)
              //       const Text('This device is supported')
              //     else
              //       const Text('This device is not supported'),
              //     const Divider(height: 100),
              //     Text('Can check biometrics: $_canCheckBiometrics\n'),
              //     ElevatedButton(
              //       onPressed: _checkBiometrics,
              //       child: const Text('Check biometrics'),
              //     ),
              //     const Divider(height: 100),
              //     Text('Available biometrics: $_availableBiometrics\n'),
              //     ElevatedButton(
              //       onPressed: _getAvailableBiometrics,
              //       child: const Text('Get available biometrics'),
              //     ),
              //     const Divider(height: 100),
              //     Text('Current State: $_authorized\n'),
              //     if (_isAuthenticating)
              //       ElevatedButton(
              //         onPressed: _cancelAuthentication,
              //         child: const Row(
              //           mainAxisSize: MainAxisSize.min,
              //           children: <Widget>[
              //             Text('Cancel Authentication'),
              //             Icon(Icons.cancel),
              //           ],
              //         ),
              //       )
              //     else
              //       Column(
              //         children: <Widget>[
              //           ElevatedButton(
              //             onPressed: _authenticate,
              //             child: const Row(
              //               mainAxisSize: MainAxisSize.min,
              //               children: <Widget>[
              //                 Text('Authenticate'),
              //                 Icon(Icons.perm_device_information),
              //               ],
              //             ),
              //           ),
              //           ElevatedButton(
              //             onPressed: _authenticateWithBiometrics,
              //             child: Row(
              //               mainAxisSize: MainAxisSize.min,
              //               children: <Widget>[
              //                 Text(_isAuthenticating
              //                     ? 'Cancel'
              //                     : 'Authenticate: biometrics only'),
              //                 const Icon(Icons.fingerprint),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //   ],
              // ),
            ],
          ),
        ),
      );
    }
  }

enum SupportState {
  unknown,
  supported,
  unsupported,
}