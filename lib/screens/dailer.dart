import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dailer extends StatefulWidget {
  const dailer({Key? key}) : super(key: key);

  @override
  _dailerState createState() => _dailerState();
}

class _dailerState extends State<dailer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      body: Center(
          child: Text(
        'Dailer',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}
