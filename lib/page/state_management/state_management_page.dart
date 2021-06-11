import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/navigation/navigation_constants.dart';
import 'package:flutter_sample/navigation/navigation_service.dart';

class StateManagementPage extends StatelessWidget {
  const StateManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('State Management'),
        ),
        body: Container(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  NavigationService.instance
                      .navigateToPage(path: NavigationConstants.SET_STATE);
                },
                child: const Text('Set State'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  NavigationService.instance
                      .navigateToPage(path: NavigationConstants.PROVIDER);
                },
                child: const Text('Provider'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  NavigationService.instance
                      .navigateToPage(path: NavigationConstants.BLOC);
                },
                child: const Text('Bloc'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    NavigationService.instance
                        .navigateToPage(path: NavigationConstants.CUBIT);
                  },
                  child: const Text('Cubit'))
            ],
          ),
        )));
  }
}
