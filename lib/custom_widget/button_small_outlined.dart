import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/style/app_fonts.dart';
import 'package:flutter_svg/svg.dart';

class ButtonSmallOutlined extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final VoidCallback press;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;

  const ButtonSmallOutlined(
      {Key? key,
      this.width,
      this.text,
      this.icon,
      required this.press,
      this.textColor,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (icon != null) ? 32 : width ?? null,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: Size(32, 32),
            padding: EdgeInsets.fromLTRB(9, 7, 9, 7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
            side: BorderSide(color: Theme.of(context).hintColor, width: 0.5),
          ),
          onPressed: () => {},
          child: (text != null)
              ? Text(text!,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.button(
                      textColor:
                          textColor ?? Theme.of(context).iconTheme.color))
              : SvgPicture.asset(
                  'assets/icon/arrow_left.svg',
                  color: Theme.of(context).iconTheme.color,
                  width: 18,
                  height: 18,
                )),
    );
  }
}
