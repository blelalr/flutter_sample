import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/page/profile/text_see_more.dart';
import 'package:flutter_sample/res/app_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DescriptionFrame extends StatelessWidget {
  const DescriptionFrame({Key? key}) : super(key: key);

  void openWebsiteByUrl(String urlString) async {
    await canLaunch(urlString)
        ? await launch(urlString)
        : debugPrint('Could not launch $urlString');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextSeeMore(
            'Wiki engines usually allow content to be written using a simplified markup language and sometimes edited with the help of a rich-text editor. There are dozens of different wiki engines in use, both standalone and part of other software, such as bug tracking systems.\nSome wiki engines are open source, whereas others are proprietary. Some permit control over different functions (levels of access); for example, editing rights may permit changing, adding, or removing material.',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: "https://www.google.com",
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => openWebsiteByUrl("https://www.google.com")),
            ])),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Followed by ",
                  style:
                      AppFonts.caption(textColor: Theme.of(context).hintColor)),
              TextSpan(text: "Vicky, Helenli, ", style: AppFonts.caption()),
              TextSpan(
                  text: "and ",
                  style:
                      AppFonts.caption(textColor: Theme.of(context).hintColor)),
              TextSpan(text: "Popo ", style: AppFonts.caption()),
            ])),
          ),
        ],
      ),
    );
  }
}
