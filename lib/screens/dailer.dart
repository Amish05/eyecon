import 'package:contacts_service/contacts_service.dart';
import 'package:eyecon/screens/contacts.dart';
import 'package:eyecon/screens/diaplpad.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ffi';

class dailer extends StatefulWidget {
  const dailer({Key? key}) : super(key: key);

  @override
  _dailerState createState() => _dailerState();
}

class _dailerState extends State<dailer> {
  Future<List<Contact>>? _contactsFuture;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _contactsFuture = _fetchContacts();
  }

  Future<List<Contact>> _fetchContacts() async {
    if (await Permission.contacts.request().isGranted) {
      Iterable<Contact> contacts = await ContactsService.getContacts();
      return contacts.toList();
    }
    return [];
  }

  void _showDialPad(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return DialPadWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.cancel_rounded),
        actions: [
          IconButton(
            icon: Icon(Icons.window_outlined),
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
      ),
      // backgroundColor: Colors.pink.shade100,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   height: 200,
          //   width: double.infinity,
          // ),
          Container(
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 15),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                contentPadding: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 15.0),
                suffixIcon: IconButton(
                  icon: Icon(Icons.mic),
                  onPressed: () => _searchController.clear(),
                ),
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Perform the search here
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          Container(
              height: 516, width: double.infinity, child: ContactListScreen()),

          FloatingActionButton(
            onPressed: () {
              _showDialPad(context);
            },
            child: const Icon(Icons.dialpad_outlined),
          ),
        ],
      ),
    );
  }
}

ImageProvider<Object>? _getAvatarImage(Contact contact) {
  if (contact.avatar != null) {
    return MemoryImage(contact.avatar!);
  } else {
    return const AssetImage('assets/images/personavt.webp');
  }
}
