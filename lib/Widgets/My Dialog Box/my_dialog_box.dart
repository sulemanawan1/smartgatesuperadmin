import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:miasuperadmin/Constants/constants.dart';
import 'package:miasuperadmin/Widgets/My%20Button/my_button.dart';
class CustomDialog extends StatelessWidget {
  final String? title, content, positiveBtnText, negativeBtnText;
  final GestureTapCallback? positiveBtnPressed;
  final GestureTapCallback? negativeBtnPressed;
  final Image? image;

  CustomDialog({
    this.image,
    this.title,
    this.content,
    this.positiveBtnText,
    this.negativeBtnText,
    this.positiveBtnPressed,
    this.negativeBtnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.3,

          // Bottom rectangular box
          margin:
              EdgeInsets.only(top: 40), // to push the box half way below circle
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.only(
              top: 60, left: 20, right: 20), // spacing inside the box
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title!,
                style: GoogleFonts.montserrat(
                    fontSize: 28,
                    color: primaryColor,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                content!,
                style: GoogleFonts.montserrat(
                    color: HexColor('#4D4D4D'), fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                buttonMinWidth: 100,
                children: <Widget>[
                  MyButton(
                    textColor: HexColor('#FFFFFF'),
                    outlinedBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    name: positiveBtnText!,
                    color: HexColor("#DC3545"),
                    maxLines: 1,
                    onPressed: positiveBtnPressed,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  MyButton(
                    textColor: HexColor('#000000'),
                    outlinedBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    name: negativeBtnText!,
                    color: HexColor("#E4E4E4"),
                    maxLines: 1,
                    onPressed: negativeBtnPressed,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                ],
              ),
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: primaryColor,
          // Top Circle with icon
          maxRadius: 40.0,
          child: image,
        ),
      ],
    );
  }
}
