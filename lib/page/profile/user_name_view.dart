import 'package:flutter/material.dart';
import 'package:flutter_sample/res/app_fonts.dart';
import 'package:flutter_svg/svg.dart';

class UserNameView extends StatelessWidget {
  const UserNameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NickName', //jrkgjworjgiowegowjeogiwejgojwegojweogjwoegjowejgowejgoiwejgowjeoigwjeog',
                style: AppFonts.bigTitle(),
                textAlign: TextAlign.start,
              ),
              UidIconText()
            ]),
      ),
    );
  }
}

class UidIconText extends StatelessWidget {
  const UidIconText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset('assets/icon/lock_f.svg',
            color: Theme.of(context).hintColor, width: 18, height: 18),
        Expanded(
          child: Text(
            'uid3625174215436', //7584efiojweiofjioewjfojewoifjowejfiowjeofjweiofjowejfiowejiof',
            style: AppFonts.button(textColor: Theme.of(context).hintColor),
            textAlign: TextAlign.start,
          ),
        )
      ],
    );
  }
}
