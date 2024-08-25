import 'package:get_storage/get_storage.dart';
import '../../common_get_storage/common_storage.dart';

class AuthStorageService {
  final _storage = GetStorage();

  void saveEmailAndPassword(String emailOrMobile, String password) {
    print('get emailor mob = $emailOrMobile');
    _storage.write('emailOrMobile', emailOrMobile);
    _storage.write('password', password);
  }

  void saveCreatedBy(String createdBy){
    print('get created by = $createdBy');

    _storage.write('createdBy', createdBy);
  }

  String getCreatedBy(){
    return _storage.read('createdBy') ?? '';
  }

  void saveEmailAndNumber(String email, String number) {
    _storage.write('emailSignUp', email);
    _storage.write('mobileSignUp', number);
  }

  void saveEmail(String email) {
    _storage.write('email', email);
  }
  String getEmailLogin(){
    return _storage.read('emailOrMobile') ?? '';
  }

  String getEmail() {
    return _storage.read('email') ?? '';
  }

  String getPassword() {
    return _storage.read('password') ?? '';
  }

  String getEmailSignUp() {
    return _storage.read('emailSignUp') ?? '';
  }

  String getMobileNumber() {
    return _storage.read('mobileSignUp') ?? '';
  }

  // void clearStorage(){
  //   _storage.erase();
  //   StorageService().setValue('showBiometricOnce', true);
  //
  // }

}
