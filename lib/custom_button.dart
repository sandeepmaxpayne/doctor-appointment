import 'package:doctor_appointment/borders.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double height;
  final double elevation;
  final double borderRadius;
  final String title;
  final Color color;
  final BorderSide borderSide;
  final TextStyle textStyle;
  final Widget icon;
  final bool hasIcon;

  CustomButton({
    this.title,
    @required this.onPressed,
    this.height = 50.0,
    this.elevation = 1.0,
    this.borderRadius = 24.0,
    this.color = Colors.black38,
    this.borderSide = Borders.defaultPrimaryBorder,
    this.textStyle,
    this.icon,
    this.hasIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: borderSide,
      ),
      height: height,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          hasIcon ? icon : Container(),
          hasIcon ? SizedBox(width: 8.0) : Container(),
          title != null
              ? Text(
                  title,
                  style: textStyle,
                )
              : Container(),
        ],
      ),
    );
  }
}
