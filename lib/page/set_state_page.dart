import 'package:flutter/material.dart';

class SetStatePage extends StatefulWidget {
  const SetStatePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SetStatePageState();
}

class _SetStatePageState extends State<SetStatePage> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Set State'),
        ),
        body: Center(
          child: Text('The Count is $_count use Set State',
            style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,// double
          )),
        ),

        floatingActionButtonLocation:FloatingActionButtonLocation.endDocked,
        floatingActionButton: Container(
          height: 140,
          child: Column(
            children: <Widget>[
              // SpeedDial
              FloatingActionButton(
                onPressed: _incrementCount,
                child: Icon(Icons.add),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: _decrementCount,
                child: Icon(Icons.remove),
              ),
            ],
          ),
        ),
      );
  }
}



