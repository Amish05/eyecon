import 'dart:ffi';

import 'package:flutter/material.dart';

class HomepageTab extends StatefulWidget {
  @override
  _HomepageTabState createState() => _HomepageTabState();
}

class _HomepageTabState extends State<HomepageTab> {
  var controller;
  @override
  void initState() {
    controller = PageController(
      viewportFraction: 0.8,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // materialApp
    return Material(
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        width: double.infinity,
        height: 270,
        child: Column(
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  height: 270,
                  // pageview
                  child: PageView(
                    controller: controller,
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: Card(
                          color: Colors.yellow,
                          child: Center(
                            child: Text('Simple Text,Keep Swiping'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Card(
                          color: Colors.white70,
                          child: Center(
                            child: Icon(Icons.favorite),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Card(
                          color: Colors.yellow,
                          child: Center(
                            child: Text('Simple Text,Keep Swiping'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Card(
                          color: Colors.yellow,
                          child: Center(
                            child: Text('Simple Text,Keep Swiping'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Card(
                          color: Colors.yellow,
                          child: Center(
                            child: Text('Simple Text,Keep Swiping'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Card(
                          color: Colors.yellow,
                          child: Center(
                            child: Text('Simple Text,Keep Swiping'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Card(
                          color: Colors.black26,
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.label_important_outline),
                              Text("Dart Logo!")
                            ],
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
