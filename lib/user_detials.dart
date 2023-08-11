import 'package:flutter/material.dart';

import 'home.dart';

class user_detials extends StatelessWidget {
  user_detials({super.key});

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: const Text("Personal Detial")),
      body: Center(
        child: Form(
            child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            key: _formkey,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Icon(
                Icons.person,
                color: Colors.lightBlue,
                size: 100.0,
              ),
              const SizedBox(height: 50.0),
              TextFormField(
                keyboardType: TextInputType.name,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'First Name',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                autofocus: false,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Last Name',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Homepage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text(" Done ")),
            ],
          ),
        )),
      ),
    );
  }
}
