import 'package:flutter/material.dart';
import 'package:flutter_sample/component/button_small.dart';
import 'package:flutter_sample/component/button_small_outlined.dart';
import 'package:flutter_svg/svg.dart';

class ButtonStackFrame extends StatelessWidget {
  const ButtonStackFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(children: [
        BuildButtonRow(buttons: [
          ButtonStackFrameNormalButton(),
          ButtonStackFrameOutLinedButton(),
          ButtonSmallOutlined(
              icon: SvgPicture.asset('assets/icon/arrow_left.svg'),
              press: () => {})
        ]),
        BuildButtonRow(buttons: [
          ButtonStackFrameOutLinedButton(),
          ButtonSmallOutlined(
              icon: SvgPicture.asset('assets/icon/arrow_left.svg'),
              press: () => {})
        ]),
        BuildButtonRow(buttons: [
          ButtonStackFrameNormalButton(),
          ButtonStackFrameOutLinedButton(),
        ]),
        BuildButtonRow(buttons: [
          ButtonStackFrameOutLinedButton(),
          ButtonStackFrameOutLinedButton(),
          ButtonStackFrameOutLinedButton(),
          ButtonSmallOutlined(
              icon: SvgPicture.asset('assets/icon/arrow_left.svg'),
              press: () => {})
        ]),
      ]),
    );
  }
}

class BuildButtonRow extends StatelessWidget {
  final List<Widget> buttons;
  const BuildButtonRow({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buttons,
    );
  }
}

class ButtonStackFrameOutLinedButton extends StatelessWidget {
  const ButtonStackFrameOutLinedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ButtonSmallOutlined(
          width: double.infinity, text: 'Type Something', press: () => {}),
    ));
  }
}

class ButtonStackFrameNormalButton extends StatelessWidget {
  const ButtonStackFrameNormalButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ButtonSmall(
        width: double.infinity,
        text: 'Type Something',
        press: () => {},
      ),
    ));
  }
}
