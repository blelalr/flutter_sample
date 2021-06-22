import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class TestSamplePage extends StatefulWidget {
  @override
  _TestSamplePageState createState() => _TestSamplePageState();
}

class _TestSamplePageState extends State<TestSamplePage> {
  var viewPortFraction = 0.2 ;

  var currentPage = 2;

  @override
  Widget build(BuildContext context) {
    final originalDevicePixelRatio =
        WidgetsBinding.instance!.window.devicePixelRatio;
    final doubledDevicePixelRatio = originalDevicePixelRatio * 2;
    return TextSizeSample(title: "Test");

    // return MaterialApp(
    //   home: Scaffold(
    //     body: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: <Widget>[
    //         Container(height: 120, child: TestSampleView(comment: 'original')),
    //         Container(
    //           height: 120,
    //           child: MediaQuery(
    //             data: MediaQueryData(devicePixelRatio: doubledDevicePixelRatio),
    //             child: TestSampleView(comment: 'with MediaQuery'),
    //           ),
    //         ),
    //         Container(
    //           height: 120,
    //           child: FakeDevicePixelRatio(
    //             fakeDevicePixelRatio: doubledDevicePixelRatio,
    //             child: TestSampleView(comment: 'with FakeDevicePixelRatio'),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}

class TestSampleView extends StatelessWidget {
final String comment;

  const TestSampleView({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('comment'),
        Container(
          margin: EdgeInsets.only(top: 10),
          width: 100,
          height: 30,
          color: Colors.green,
        )
      ],
    );
  }
}

class FakeDevicePixelRatio extends StatelessWidget {
  final num fakeDevicePixelRatio;
  final Widget child;

  FakeDevicePixelRatio({required this.fakeDevicePixelRatio, required this.child})
      : assert(fakeDevicePixelRatio != null);

  @override
  Widget build(BuildContext context) {
    final ratio =
        fakeDevicePixelRatio / WidgetsBinding.instance!.window.devicePixelRatio;

    return FractionallySizedBox(
        widthFactor: 1 / ratio,
        heightFactor: 1 / ratio,
        child: Transform.scale(scale: ratio, child: child));
  }
}


class TextSizeSample extends StatefulWidget {
  TextSizeSample({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TextSizeSampleState createState() => new _TextSizeSampleState();
}

class _TextSizeSampleState extends State<TextSizeSample> {
  int _counter = 0;
  late MediaQueryData queryData;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;
    TextStyle style38 = new TextStyle(
      inherit: true,
      fontSize: 38.0,
    );
    TextStyle style20 = new TextStyle(
      inherit: true,
      fontSize: 20.0,
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Text(
            'Button tapped $_counter time${ _counter == 1 ? '' : 's' }.',
            style: style38,
          ),
          new Text(
            'size (pixels): w=${queryData.size.width * devicePixelRatio}, h=${queryData.size.height * devicePixelRatio}',
            style: style20,
          ),
          new Text(
            'devicePixelRatio: $devicePixelRatio',
            style: style20,
          ),
          new Text(
            'size: w=${queryData.size.width}, h=${queryData.size.height}',
            style: style20,
          ),
          new Text(
            'textScaleFactor: w=${queryData.textScaleFactor}',
            style: style20,
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}