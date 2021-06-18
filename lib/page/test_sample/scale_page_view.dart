import 'dart:math';

import 'package:flutter/material.dart';

class ScalePageView extends StatefulWidget {
  @override
  _ScalePageViewState createState() => _ScalePageViewState();
}

class _ScalePageViewState extends State<ScalePageView> {
  double viewPortFraction = 0.2;

  late PageController pageController;

  int currentPage = 2;

  double page = 2.0;

  @override
  void initState() {
    pageController =
        PageController(initialPage: currentPage, viewportFraction: viewPortFraction);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              child: PageView.builder(
                onPageChanged: (pos) {
                  setState(() {
                    currentPage = pos;
                  });
                },
                controller: pageController,
                itemCount: 100000,
                itemBuilder: (context, index) {
                  return Transform.scale(
                      scale: index == currentPage ? 1 : 0.85,
                      child: circleOffer(index%5));
                },
              ),
            ),
          ),
    );
  }

  Widget circleOffer(int index) {

    return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Card(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          shape: CircleBorder(side: BorderSide(color: Colors.grey.shade200, width: 2)),
          child:Container(color: Colors.primaries[index]),
        ),
      );
  }
}