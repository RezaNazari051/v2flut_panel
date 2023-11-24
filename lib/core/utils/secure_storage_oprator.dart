

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yo_panel/locator.dart';

class SecureStorageOprator {
late FlutterSecureStorage secureStorage;

SecureStorageOprator(){
  secureStorage=locator<FlutterSecureStorage>();
}



  void saveLoginToken(String token)async{
    await secureStorage.write(key: 'loginToken', value: token);
  }
  getLoginToken()async{
    final token=await secureStorage.read(key: 'loginToken');
    return token;
  }
}