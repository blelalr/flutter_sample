import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/navigation/navigation_constants.dart';
import 'package:flutter_sample/navigation/navigation_service.dart';

class InfinitePage extends StatelessWidget {
  const InfinitePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Infinite List'),
        ),
        body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () { NavigationService.instance.navigateToPage(path: NavigationConstants.INFINITE_BLOC); },
                    child: const Text('Infinite List Bloc Page'),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () { NavigationService.instance.navigateToPage(path: NavigationConstants.INFINITE_CUBIT); },
                    child: const Text('Infinite List Cubit Page'),
                  )
                ],
              ),
            )));
  }
}
