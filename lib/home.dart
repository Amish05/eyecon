import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:eyecon/screens/dailer.dart';
import 'package:eyecon/screens/homescreen.dart';
import 'package:eyecon/screens/lookup.dart';
import 'package:eyecon/screens/more.dart';
import 'package:eyecon/screens/sms.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedPage = 0;
  final List<Widget> _pages = [
    HomepageScreen(),
    SMSScreen(),
    dailer(),
    lookup(),
    more(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: "Home"),
          TabItem(icon: Icons.sms, title: "SMS"),
          TabItem(icon: Icons.dialpad, title: "Dialer"), // Add a title here
          TabItem(icon: Icons.search, title: "Lookup"),
          TabItem(icon: Icons.more_vert, title: "More"),
        ],
        initialActiveIndex: selectedPage,
        onTap: (int index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}
