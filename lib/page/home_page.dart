import 'package:flutter/material.dart';
import 'package:flutter_sample/navigation/navigation_constants.dart';
import 'package:flutter_sample/navigation/navigation_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  NavigationService.instance.navigateToPage(
                      path: NavigationConstants.STATE_MANAGEMENT);
                },
                child: const Text('State Management'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  NavigationService.instance
                      .navigateToPage(path: NavigationConstants.INFINITE);
                },
                child: const Text('Bloc/Cubit Infinite List'),
              ),
              // const SizedBox(height: 30),
              // ElevatedButton(
              //   onPressed: () { NavigationService.instance.navigateToPage(path: NavigationConstants.VIDEO_SCROLL); },
              //   child: const Text('Video Scroll'),
              // ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  NavigationService.instance
                      .navigateToPage(path: NavigationConstants.LAYOUT_TEST);
                },
                child: const Text('Layout Test'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  NavigationService.instance
                      .navigateToPage(path: NavigationConstants.DIALOG);
                },
                child: const Text('Dialog'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  NavigationService.instance
                      .navigateToPage(path: NavigationConstants.HOME);
                },
                child: const Text('Home'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  NavigationService.instance
                      .navigateToPage(path: NavigationConstants.PROFILE);
                },
                child: const Text('Profile'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  NavigationService.instance
                      .navigateToPage(path: NavigationConstants.SEARCH);
                },
                child: const Text('Search'),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ));
  }
}
