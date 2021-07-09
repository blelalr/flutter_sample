import 'package:flutter/material.dart';
import 'package:flutter_sample/res/app_fonts.dart';

class ButtonSmall extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;

  const ButtonSmall(
      {Key? key,
      this.width,
      required this.text,
      required this.press,
      this.textColor,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? null,
      child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.deepOrange.shade900,
            minimumSize: Size(0, 32),
            padding: EdgeInsets.fromLTRB(9, 7, 9, 7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
            backgroundColor:
                backgroundColor ?? Theme.of(context).colorScheme.primary,
          ),
          onPressed: () => {},
          child: Text(text,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: AppFonts.button(
                  textColor:
                      textColor ?? Theme.of(context).colorScheme.onPrimary))),
    );
  }
}
