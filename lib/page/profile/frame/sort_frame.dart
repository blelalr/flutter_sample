import 'package:flutter/material.dart';
import 'package:flutter_sample/res/app_fonts.dart';
import 'package:flutter_svg/svg.dart';

class SortFrame extends StatelessWidget {
  const SortFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {print('Sort by Relevance click! ')},
      behavior:
          HitTestBehavior.translucent, //add this to fix click on translucent
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icon/icon_colse.svg',
                color: Theme.of(context).hintColor, width: 24, height: 24),
            SizedBox(width: 4),
            Flexible(
              child: Text(
                  'Sort by RelevanceSort by Relevance\nSort by RelevanceSort by Relevance\nSort by Relevance',
                  style: AppFonts.button()),
            )
          ],
        ),
      ),
    );
  }
}
