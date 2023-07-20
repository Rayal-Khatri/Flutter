import 'package:flutter/material.dart';

class LoadingPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/cat.gif',
              height: 100,
              width: 100), // Replace 'loading.gif' with your GIF file name
          SizedBox(height: 16),
          Text('Loading...'),
        ],
      )),
    );
  }
}
