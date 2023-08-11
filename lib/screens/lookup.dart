import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class lookup extends StatefulWidget {
  const lookup({Key? key}) : super(key: key);

  @override
  _lookupState createState() => _lookupState();
}

class _lookupState extends State<lookup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      body: Center(
          child: Text(
        'Lookup',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}
