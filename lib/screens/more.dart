import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class more extends StatefulWidget {
  const more({Key? key}) : super(key: key);

  @override
  _moreState createState() => _moreState();
}

class _moreState extends State<more> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      body: Center(
          child: Text(
        'More',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}
