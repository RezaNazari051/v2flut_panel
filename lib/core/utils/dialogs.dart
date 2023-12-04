import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class AppDialog{




 static showQrCodeDialog(BuildContext context,{required String content}){
    return showCupertinoModalPopup(context: context, builder: (context) {

      return CupertinoAlertDialog(
        title: Text('اکانت شما'),
        content:PrettyQrView.data(data: content,)
      );
    },);
  }



}