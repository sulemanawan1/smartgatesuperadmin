import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/constants.dart';

class MyPasswordTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;
  final Color? labelTextColor;
  final Color? hintTextColor;
  final Color onFocusedBorderColor;
  final Color onEnabledBorderColor;
  final Color? fillcolor;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function()? togglePasswordView;

  const MyPasswordTextFormField(
      {super.key,
      this.fontWeight,
      this.controller,
      this.width,
      this.height,
      this.hintText,
      this.labelText,
      this.labelTextColor,
      this.hintTextColor,
      required this.onFocusedBorderColor,
      required this.onEnabledBorderColor,
      this.fillcolor,
      required this.obscureText,
      this.validator,
      this.onTap,
      this.togglePasswordView});

  @override
  State<MyPasswordTextFormField> createState() =>
      _MyPasswordTextFormFieldState();
}

class _MyPasswordTextFormFieldState extends State<MyPasswordTextFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height:widget.height ,
      child: TextFormField(
        onTap: widget.onTap,
        validator: widget.validator,
        obscureText: widget.obscureText,
        maxLines: 1,
        controller: widget.controller,
        decoration: InputDecoration(
          suffix: GestureDetector(
              onTap: widget.togglePasswordView,
              child: Icon(
                widget.obscureText
                    ? Icons.visibility
                    : Icons.visibility_off,
              )),

    labelStyle:     GoogleFonts.montserrat(
    color: secondaryColor,
    fontWeight: FontWeight.w500
    ),
          hintStyle: TextStyle(
            color: widget.hintTextColor,
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
          fillColor: widget.fillcolor,

          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10.0),
          //   borderSide:
          //       BorderSide(color: widget.onFocusedBorderColor, width: 1),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10.0),
          //   borderSide: BorderSide(
          //     color: widget.onEnabledBorderColor,
          //     width: 1,
          //   ),
          // ),
        ),
      ),
    );
  }
}
