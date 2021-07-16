import 'package:flutter/cupertino.dart';
import 'package:flutter_sample/res/app_fonts.dart';

class NumberItemView extends StatelessWidget {
  final String number;
  final String title;
  const NumberItemView({Key? key, required this.number, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Center(
        child: Column(
          children: [
            Container(child: Text('$number', style: AppFonts.subTitle())),
            Container(child: Text('$title', style: AppFonts.caption())),
          ],
        ),
      ),
    );
  }
}
