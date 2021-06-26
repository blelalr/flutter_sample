import 'package:flutter/material.dart';
import 'package:flutter_sample/page/test_sample/button/button_large.dart';
import 'package:flutter_sample/page/test_sample/button/button_small.dart';
import 'package:flutter_sample/style/app_colors.dart';
import 'package:flutter_sample/style/app_fonts.dart';
import 'package:flutter_sample/page/test_sample/carousel_view.dart';
import 'package:flutter_sample/page/test_sample/scale_page_view.dart';

class LayoutTestSample extends StatelessWidget {
  LayoutTestSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Layout Test Sample'),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Example1(),
              Divider(),
              CustomButton(),
              Divider(),
              FullWidthExample(),
              Divider(),
              PaddingExample(),
              Divider(),
              ContainerPaddingExample(),
              Divider(),
              AspectRatioImageExample(),
              Divider(),
              ContentExample(),
              Divider(),
              VerticalEqualSpaceExample(),
              Divider(),
              HorizontalEqualSpaceExample(),
              Divider(),
              HorizontalFlexSpaceExample(),
              Divider(),
              RemainSpaceExample(),
              Divider(),
              ScalePageView(),
              Divider(),
              CarouselView()
            ],
          ),
        ));
  }
}

class Example1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Big Title", style: AppFonts.bigTitle()),
          Text("SubTitle", style: AppFonts.subTitle()),
          Text("Large Body Text", style: AppFonts.largeBodyText()),
          Text("Body Text", style: AppFonts.bodyText()),
          Text("Button Text", style: AppFonts.button()),
          Text("Caption Text", style: AppFonts.caption()),
          Text("Mini Text", style: AppFonts.mini()),
        ],
      ),
    );
  }
}

class FullWidthExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.tealAccent,
      child: Center(child: Text("Full Width x 200")),
    );
  }
}

class PaddingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        height: 200,
        color: Colors.pinkAccent,
        child: Center(child: Text("20px Padding")),
      ),
    );
  }
}

class ContainerPaddingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 200,
        color: Colors.pinkAccent,
        child: Container(
          color: Colors.lightGreen,
          child: Center(child: Text("Container padding")),
        ));
  }
}

class AspectRatioImageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.lightGreenAccent,
      child: AspectRatio(
          aspectRatio: 3 / 2,
          child: Image(
            image: AssetImage("assets/images/img_snoopy.jpeg"),
            fit: BoxFit.cover,
          )),
    );
  }
}

class ContentExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: null,
        height: null,
        color: Colors.amber,
        child: Text(
          "Content Example\nLine 1\nLine 2",
        ));
  }
}

class VerticalEqualSpaceExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Flexible(child: Container(color: Colors.green)),
          Flexible(child: Container(color: Colors.limeAccent)),
          Flexible(child: Container(color: Colors.amber)),
          Flexible(child: Container(color: Colors.pink)),
        ],
      ),
    );
  }
}

class HorizontalEqualSpaceExample extends StatelessWidget {
  const HorizontalEqualSpaceExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 10),
      color: Colors.grey,
      child: Row(
        children: [
          Flexible(
            // flex: 1,
            child: Container(
                // margin: EdgeInsets.only(left: 10),
                height: 50,
                color: Colors.blue),
          ),
          Flexible(
            // flex: 3,
            child: Container(height: 50, color: Colors.green),
          ),
        ],
      ),
    );
  }
}

class HorizontalFlexSpaceExample extends StatelessWidget {
  const HorizontalFlexSpaceExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.only(top: 10),
        color: Colors.grey,
        height: 50,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                flex: 2,
                child: Container(
                    // margin: EdgeInsets.only(left: 15, right: 20),
                    color: Colors.blue)),
            Expanded(flex: 1, child: Container(color: Colors.red)),
          ],
        ));
  }
}

class RemainSpaceExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 200,
          width: 100,
          alignment: Alignment.center,
          color: Colors.amber,
          child: Text("First Block"),
        ),
        Expanded(
          child: Container(
            height: 200,
            alignment: Alignment.center,
            child: Text("Remain Block"),
            color: Colors.limeAccent,
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('LargeButton v'),
            Divider(),
            ButtonLarge(
              text: 'Button without size \n Wrap Content',
              backgroundColor: Colors.transparent,
              textColor: AppColors.labelLightL2,
              press: () => {print('Press')},
            ),
            Divider(),
            ButtonLarge(
              width: 300,
              text: 'Button with Size Fix Width \n and specific set color',
              backgroundColor: AppColors.primaryLightP2,
              textColor: AppColors.primaryLightP1,
              press: () => {print('Press')},
            ),
            Divider(),
            ButtonLarge(
              width: double.infinity,
              text: 'Button with Fill Width ',
              press: () => {print('Press')},
            ),
            Text('ButtonSmall v'),
            Divider(),
            ButtonSmall(
              text: 'Button without size \n Wrap Content',
              press: () => {print('Press')},
            ),
            Divider(),
            ButtonSmall(
              width: 300,
              text: 'Button with Size Fix Width \n and specific set color',
              backgroundColor: AppColors.primaryLightP2,
              textColor: AppColors.primaryLightP1,
              press: () => {print('Press')},
            ),
            Divider(),
            ButtonSmall(
              width: double.infinity,
              text: 'Button with Fill Width ',
              press: () => {print('Press')},
            )
          ],
        ),
      ),
    );
  }
}
