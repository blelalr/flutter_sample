import 'package:flutter/material.dart';
import 'package:flutter_sample/component/button_small.dart';
import 'package:flutter_sample/page/profile/top_frame_stack_view.dart';
import 'package:flutter_sample/res/app_colors.dart';
import 'package:flutter_sample/res/app_fonts.dart';

class TopFrame extends StatelessWidget {
  const TopFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: double.infinity, height: 0.5, color: AppColors.line83),
            SizedBox(height: 8),
            TopFrameStackView(),
            Padding(
              padding:
                  const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
              child: Text(
                'Grow your profile and unlock features such as customizable contact buttons, insights, verification badges and more.',
                style: AppFonts.caption(textColor: Theme.of(context).hintColor),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: ButtonSmall(
                  width: double.infinity,
                  text: 'Upgrade now!',
                  press: () => {}),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
                width: double.infinity, height: 1, color: AppColors.line83),
            SizedBox(
              height: 8,
            ),
          ],
        ));
  }

  closeClick() {
    print('Click');
  }
}
