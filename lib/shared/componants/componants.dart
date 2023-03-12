import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../style/colors.dart';

Widget customButtom({
  required Color buttomColor,
  Color borderColor = primaryColor,
  Color textColor = Colors.white,
  double? buttomWidth,
  required String text,
  required Function()? press,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(color: borderColor),
        color: buttomColor,
      ),
      width: buttomWidth,
      child: MaterialButton(
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );

Widget customLine({double margin = 0.0}) => Container(
      color: Colors.grey[300],
      width: double.infinity,
      height: 1,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: margin),
    );

Widget customTextFeild({
  Color textColor = primaryColor,
  required TextEditingController controller,
  required TextInputType inputType,
  required String title,
  IconData? pIcon,
  bool isPassword = false,
  IconData? sIcon,
  String? Function(String?)? validate,
  Function()? tap,
  String? Function(String?)? change,
  String? Function(String?)? Submit,
  suffixPress,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: inputType,
      obscureText: isPassword,
      validator: validate,
      onChanged: change,
      onFieldSubmitted: Submit,
      onTap: tap,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffdddddd),
          ),
        ),
        labelText: title,
        labelStyle: TextStyle(color: Colors.grey[500]),
        suffixStyle: TextStyle(backgroundColor: Colors.grey[700]),
        suffixIcon: IconButton(
          icon: Icon(
            sIcon,
            color: primaryColor,
          ),
          onPressed: suffixPress,
        ),
      ),
    );
var genderItems = ['female', 'male', 'I don\'t want to tell'.tr];
DropdownMenuItem<String> buildMenuItem(context, String item) {
  return DropdownMenuItem(
    value: item,
    alignment: AlignmentDirectional.center,
    child: Text(item, style: Theme.of(context).textTheme.subtitle2),
  );
}

var tourismType = [
  'cultural tourism'.tr,
  'Medical tourism'.tr,
  'Religious Tourism'.tr,
  'Adventure tourism'.tr,
  'rural tourism'.tr,
  'Heritage tourism'.tr,
  'Sports tourism'.tr,
  'Educational tourism'.tr,
];
var governorates = [
  'Giza'.tr,
  'Alexandria'.tr,
  'Dakahlia'.tr,
  'Eastern'.tr,
  'Menoufia'.tr,
  'Qalyubia'.tr,
  'the lake'.tr,
  'western'.tr,
  'Port Said'.tr,
  'Damietta'.tr,
  'Ismailia'.tr,
  'Suez'.tr,
  'Kafr El-Sheikh'.tr,
  'Fayoum'.tr,
  'Bani Sweif'.tr,
  'subtracted'.tr,
  'North Sinai'.tr,
  'South of Sinaa'.tr,
  'Minya'.tr,
  'Asyut'.tr,
  'Sohag'.tr,
  'Qena'.tr,
  'The Red Sea'.tr,
  'the shortest'.tr,
  'Aswan'.tr,
  'oases'.tr,
  'the new Valley'.tr,
];
