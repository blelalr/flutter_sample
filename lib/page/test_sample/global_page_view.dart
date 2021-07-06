import 'package:flutter/material.dart';

class GlobalPageView extends StatefulWidget {
  @override
  _GlobalPageViewState createState() => new _GlobalPageViewState();
}

class _GlobalPageViewState extends State<GlobalPageView> {
  late PageController controller;
  int currentPage = 0;

  @override
  initState() {
    super.initState();
    controller = PageController(
      initialPage: currentPage,
      keepPage: false,
      viewportFraction: 0.2,
    );
    Future.delayed(const Duration(milliseconds: 20), () {
      setState(() {
        controller.animateToPage(2,
            duration: Duration(milliseconds: 1), curve: Curves.bounceIn);
      });
    });
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 65,
          child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              controller: controller,
              itemBuilder: (context, index) => builder(index)),
        ),
        Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(50.0),
            )),
      ],
    );
  }

  builder(int index) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double value = 1.0;
          if (controller.position.haveDimensions) {
            value = (controller.page ?? 0) - index;
            value = (1 - (value.abs() * 0.25)).clamp(0.5, 1);
          }
          return Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Curves.easeOut.transform(value) * 64,
                width: Curves.easeOut.transform(value) * 64,
                child: Card(
                  elevation: 2,
                  clipBehavior: Clip.antiAlias,
                  shape: CircleBorder(
                      side: BorderSide(color: Colors.grey.shade200, width: 2)),
                  child: Container(
                      color: Colors.primaries[index % 17],
                      child: Center(child: Text('$value'))),
                ),
              ));
        });
  }
}
