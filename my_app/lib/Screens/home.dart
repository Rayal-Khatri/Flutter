import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? Key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: Container(
        child: Text(
          'This is home screen',
          style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
