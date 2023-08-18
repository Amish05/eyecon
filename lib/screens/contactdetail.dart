import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactDetial extends StatelessWidget {
  final Contact contact;

  ContactDetial({required this.contact});

  @override
  Widget build(BuildContext context) {
    Widget bigCircle = Container(
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: <Widget>[
            bigCircle,
            Positioned(
              top: 10.0,
              left: 120.0,
              child: CircleButton(
                onTap: () => print("Cool"),
                iconData: Icons.message_outlined,
              ),
            ),
            Positioned(
              top: 30.0,
              left: 190.0,
              child: CircleButton(
                onTap: () => print("Cool"),
                iconData: FontAwesomeIcons.facebook,
              ),
            ),
            Positioned(
              top: 30.0,
              right: 190.0,
              child: CircleButton(
                onTap: () => print("Cool"),
                iconData: FontAwesomeIcons.whatsapp,
              ),
            ),
            Positioned(
              top: 90.0,
              right: 220.0,
              child: CircleButton(
                onTap: () => print("Cool"),
                iconData: Icons.call,
              ),
            ),
            Positioned(
              top: 90.0,
              left: 220.0,
              child: CircleButton(
                onTap: () => print("Cool"),
                iconData: Icons.more_vert,
              ),
            ),
            Positioned(
              top: 120.0,
              left: 120.0,
              child: CircleButton(
                onTap: () => print("Cool"),
                iconData: Icons.satellite,
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 0,
              right: 0,
              child: Center(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  strutStyle: StrutStyle(fontSize: 12.0),
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    text: contact.displayName ?? '',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;

  const CircleButton({required this.onTap, required this.iconData});

  @override
  Widget build(BuildContext context) {
    double size = 60.0;

    return InkResponse(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
  }
}
