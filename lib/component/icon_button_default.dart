import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtonDefault extends StatelessWidget {
  final String iconPath;
  final double? size;
  final Color? color;
  final VoidCallback? press;
  const IconButtonDefault(
      {Key? key, required this.iconPath, this.size, this.press, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: size ?? 24,
      icon: SvgPicture.asset(iconPath,
          color: color ?? Theme.of(context).iconTheme.color),
      onPressed: press ?? () => {print('Theme Icon press')},
    );
  }
}
