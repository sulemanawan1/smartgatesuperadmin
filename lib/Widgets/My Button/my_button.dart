import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatefulWidget {
  final OutlinedBorder? outlinedBorder;

  final double? height;
  final double? width;
  final double? elevation;
  final double? fontSize;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final bool? loading;

  final double? border;
  final String name;
  final Color color;
  final Color? textColor;
  final int? maxLines;
  final void Function()? onPressed;

  const MyButton({
    super.key,
    this.outlinedBorder,
    this.elevation,
    this.fontWeight,
    this.letterSpacing,
    this.fontSize,
    this.textColor,
    this.height,
    this.width,
    this.border,
    required this.name,
    required this.color,
    this.maxLines,
    this.onPressed,
    this.loading = false,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: widget.elevation,
            shape: widget.outlinedBorder,
            backgroundColor: widget.color),
        child: widget.loading!
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                widget.name,
                maxLines: widget.maxLines,
                style: GoogleFonts.montserrat(
                    color: widget.textColor,
                    fontWeight: widget.fontWeight,
                    letterSpacing: widget.letterSpacing,
                    fontSize: widget.fontSize),
              ),
        onPressed: widget.onPressed,
      ),
    );
  }
}
