//
//
//
// import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:universal_platform/universal_platform.dart';
//
// bool isMobile(BuildContext context){
//   if( (UniversalPlatform.isIOS || UniversalPlatform.isAndroid) && getWindowType(context) <= AdaptiveWindowType.small){
//     return true;
//   }else{
//     return false;
//   }
// }
//
// extension StringExtension on String{
//   String toMoneyFormat() => replaceAllMapped(
//     RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
//         (Match match) => '${match[1]},',
//   );
// }