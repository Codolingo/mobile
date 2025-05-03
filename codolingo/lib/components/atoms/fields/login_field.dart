import 'package:codolingo/components/atoms/fields/field_type.dart';
import 'package:flutter/material.dart';

class CodolingoLoginField extends StatelessWidget {
  const CodolingoLoginField({super.key, required this.hintText, this.controller, this.type = FieldTypes.ClassicField, this.hidden = false});

  final String hintText;
  final FieldTypes type;
//  final void Function()? onPressed;
  final TextEditingController? controller;
  final bool hidden;
  //final bool selected;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: hidden,
      controller: controller,
      cursorColor: type.type.cursorColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: type.type.hintTextColor),
        filled: true,
        fillColor: type.type.fillColor,
        hoverColor: type.type.fillColor,
        // border: InputBorder.none,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
      ),
      style: TextStyle(
        color: type.type.textColorTaped,
        fontSize: 18,
      ),
    );
  }
}
