import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/bloc/theme/theme_cubit.dart';
import 'package:flutter_sample/style/app_colors.dart';
import 'package:flutter_sample/style/app_fonts.dart';

class ButtonLarge extends StatelessWidget {
  final double? width;
  final String text;
  final VoidCallback press;
  final Color? backgroundColor;
  final Color? textColor;

  const ButtonLarge(
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
            minimumSize: Size(0, 48),
            alignment: Alignment.center,
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            backgroundColor:
                backgroundColor ?? Theme.of(context).colorScheme.primary,
            shadowColor: Colors.white38,
          ),
          onPressed: () => {},
          child: Text(text,
              style: AppFonts.button(
                  textColor:
                      textColor ?? Theme.of(context).colorScheme.onPrimary))),
    );
  }
}
