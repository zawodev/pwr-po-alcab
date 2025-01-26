import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '/main.dart';


ChooseCarAppButton({
  Function? onPressed,
  String? title,
  required BuildContext context,
  Color? color,
  Color? textColor,
}) {
  return AppButton(
    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24), side: const BorderSide(color: Color(0xff808080), width: 1)),
    text: title,
    color: color ?? const Color(0xff000000),
    textColor: textColor ?? const Color(0xfffffbfb),
    onTap: () {
      onPressed!();
    },
    width: context.width(),
  );
}

InputDecoration RegisterInputDecoration({String? name, BuildContext? context, Widget? icon}) {
  return InputDecoration(
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.4), width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.4), width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.4), width: 1),
    ),
    labelText: name,
    labelStyle: primaryTextStyle(),
    hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 14, color: Color(0xff000000)),
    filled: true,
    fillColor: const Color(0xfff2f2f3),
    isDense: false,
    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    suffixIcon: icon,
  );
}