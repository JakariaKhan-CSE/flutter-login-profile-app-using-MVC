import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  // below this line code see carefully
  final String? Function(String?)? validator;  //final String?(this null important) otherwise return null show error> Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;
  const CustomTextField({super.key, required this.controller, required this.hintText,  this.keyboardType, this.validator, this.suffixIcon, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText??false, //obscureText must deya lagbe kintu ami nullable variable niyesi se jonno error disse. tai default false value kore disse or if null then fit false
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: const TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.red,width: 0.5)
          ),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.transparent,width: 0)
          ),
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.grey,width: 0.5)
          ),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.transparent,width: 0.5)
          ),
          border: InputBorder.none,

        ),
        controller: controller,
        cursorHeight: 25,

        style: const TextStyle(fontSize: 14,color: Colors.black, fontWeight: FontWeight.w500),
        validator: validator,
      ),
    );
  }
}