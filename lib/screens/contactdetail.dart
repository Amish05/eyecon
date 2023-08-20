import 'dart:typed_data';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
                onTap: () async {
                  Uri url = Uri.parse('sms:${contact.phones![0].value}');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Application unable to open SMS.';
                  }
                },
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
                onTap: () async {
                  if (contact.phones != null && contact.phones!.isNotEmpty) {
                    final whatsapp = contact.phones![0].value ?? '';
                    Uri whatsappUrlAndroid =
                        Uri.parse("whatsapp://send?phone=$whatsapp&text=");

                    if (await canLaunchUrl(whatsappUrlAndroid)) {
                      await launchUrl(whatsappUrlAndroid);
                    }
                  }
                },
                iconData: FontAwesomeIcons.whatsapp,
              ),
            ),
            Positioned(
              top: 90.0,
              right: 220.0,
              child: CircleButton(
                onTap: () async {
                  Uri url = Uri.parse('tel:${contact.phones![0].value}');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Application unable to open dialer.';
                  }
                },
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
              top: 80.0,
              left: 85.0,
              child: CircleAvatar(
                backgroundImage: _getAvatarImage(contact),
                radius: 65.0,
              ),
            ),
            Positioned(
              bottom: 40.0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    strutStyle: StrutStyle(fontSize: 12.0),
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      text: (contact.displayName ?? ''),
                    ),
                  ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    strutStyle: StrutStyle(fontSize: 12.0),
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      text: (contact.phones![0].value ?? ''),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ImageProvider<Object>? _getAvatarImage(Contact contact) {
    if (contact.avatar!.isNotEmpty) {
      Uint8List uint8ImageData =
          Uint8List.fromList(contact.avatar as List<int>);
      //  print('Image data length: ${uint8ImageData.length}');

      return MemoryImage(uint8ImageData);
    } else {
      return const AssetImage('assets/images/personavt.webp');
    }
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
