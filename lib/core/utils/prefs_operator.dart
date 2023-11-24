import 'package:shared_preferences/shared_preferences.dart';

import '../../locator.dart';

class PrefsOperator {
  late SharedPreferences sharedPreferences;
  PrefsOperator() {
    sharedPreferences = locator<SharedPreferences>();
  }


  // saveLoginToken(String token)async{
  //   await sharedPreferences.setString('user_token', token);
  // }
  // // saveUserData(token, userName, mobile) async {
  // //   sharedPreferences.setString("user_token", token);
  // //   sharedPreferences.setString("user_name", userName);
  // //   sharedPreferences.setString("user_mobile", mobile);
  // //   sharedPreferences.setBool("loggedIn", true);
  // // }
  // saveUserData({required String username,required String password}){
  //   sharedPreferences.setString('username', username);
  //   sharedPreferences.setString('password', password);
  // }
  // getUsername(){
  //   final String? username=sharedPreferences.getString('username');
  //  return username;
  // }
  // getPassword(){
  //   final String? password=sharedPreferences.getString('password');
  //   return password;
  // }
  // getUserToken() async {
  //   final String? userToken = sharedPreferences.getString('user_token');
  //   return userToken;
  // }
  // clearToken(){
  //   sharedPreferences.clear();
  // }


  
  //
  // changeIntroState() async {
  //   sharedPreferences.setBool("showIntro", false);
  // }
  //
  // Future<bool> getIntroState() async {
  //   return sharedPreferences.getBool("showIntro") ?? true;
  // }
  //
  // Future<bool> getLoggedIn() async {
  //   return sharedPreferences.getBool("loggedIn") ?? false;
  // }
  //
  // Future<void> logout() async {
  //   sharedPreferences.clear();
  //   sharedPreferences.setBool("showIntro", false);
  // }

}