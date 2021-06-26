import 'package:flutter/material.dart';
import 'package:flutter_sample/navigation/navigation_constants.dart';
import 'package:flutter_sample/navigation/navigation_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              NavigationService.instance
                  .navigateToPage(path: NavigationConstants.STATE_MANAGEMENT);
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
                  .navigateToPage(path: NavigationConstants.TEST_SAMPLE);
            },
            child: const Text('Layout Sample'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              NavigationService.instance
                  .navigateToPage(path: NavigationConstants.DIALOG_SAMPLE);
            },
            child: const Text('Dialog Sample'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              NavigationService.instance
                  .navigateToPage(path: NavigationConstants.THEME_SAMPLE);
            },
            child: const Text('Custom Component'),
          )
        ],
      ),
    ));
  }
}
