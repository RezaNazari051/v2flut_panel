import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../config/theme/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    Key? key,
    String? title,
    String hintText='',
    double width=double.infinity,
    double height=55,
    double marginTop=0,
    double marginBottom=0,
    double? titleFontSize,
    Color? titleTextColor,
    Color? fillColor,
    TextInputType? textInputType,
    required TextEditingController controller,
    FormFieldValidator<String>? textFunction

  })  :
  _title = title,
  _hintText=hintText,
  _width=width,
  _height=height,
  _marginTop=marginTop,
  _marginBottom=marginBottom,
  _titleFontSize=titleFontSize,
  _titleTextColor=titleTextColor,
  _fillColor=fillColor,
  _textInputType=textInputType,
  _controller=controller,
  _textFunction=textFunction,
  super(key: key);

  final String? _title;
  final String _hintText;
  final double _width;
  final double _height;
  final double _marginTop;
  final double _marginBottom;
  final double? _titleFontSize;
  final Color? _titleTextColor;
  final Color? _fillColor;
  final TextEditingController _controller;
  final TextInputType? _textInputType;
  final FormFieldValidator<String>? _textFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: _marginTop, bottom: _marginBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_title != null)
            Text(
              _title!,
              style:  TextStyle(color: _titleTextColor??Colors.white,fontSize: _titleFontSize),
            ),
          Gap(_title != null ? 5 : 0),
          SizedBox(
            width:_width ,
            height:_height ,
            child: TextFormField(
              validator:_textFunction ,
              controller: _controller,
              keyboardType: _textInputType,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: _fillColor,
                hintStyle: const TextStyle(
                  color: Color(0xff8692A6),
                ),
                hintText: _hintText,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.grayColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.grayColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.grayColor),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
