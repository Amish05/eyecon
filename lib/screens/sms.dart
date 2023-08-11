import 'package:eyecon/screens/contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SMS extends StatefulWidget {
  const SMS({Key? key}) : super(key: key);

  @override
  _SMSState createState() => _SMSState();
}

class _SMSState extends State<SMS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ContactListScreen(),
      ),
    );
  }
}
