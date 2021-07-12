import 'package:flutter/material.dart';

class LoaderBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 26, bottom: 26),
      width: double.infinity,
      child: const Center(
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(strokeWidth: 3),
        ),
      ),
    );
  }
}
