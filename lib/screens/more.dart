import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class more extends StatefulWidget {
  const more({Key? key}) : super(key: key);

  @override
  _moreState createState() => _moreState();
}

class _moreState extends State<more> {
  void openAndroidBackupSettings() async {
  Uri url =Uri.parse('content://com.android.settings/cloud/backup') ;
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    // Handle if the URL cannot be launched
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 122, 52, 77),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Container(
                  
                  height: 130,
                  margin: EdgeInsets.all(10),
                  child: Card(
                    // Optional: Set elevation to create a shadow effect
                
                    elevation: 8.0,
                    // Optional: Set shape to give the card rounded corners or other shapes
                
                    // Optional: Set color or background decoration for the card
                
                    color: Colors.white,
                
                    child: ListTile(
                      // Content of the card
                
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/personavt.webp'),
                        radius: 45.0,
                      ), // Example: leading icon
                
                      title: Text('Khizar Hayat'), // Example: title text
                
                      subtitle: Text('Engineer'), // Example: subtitle text
                
                      trailing:FloatingActionButton(onPressed: (){}, child: Icon(Icons.logout, color: Colors.black,),
                     backgroundColor: Colors.white, 
                      )
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                
                child: Card(
                  // Optional: Set elevation to create a shadow effect

                  elevation: 4.0,

                  // Optional: Set shape to give the card rounded corners or other shapes

                  // Optional: Set color or background decoration for the card

                  color: Colors.white,

                  child: ListTile(
                    // Content of the card

                    leading: Icon(Icons.dark_mode_outlined),

                    title: Text('Dark Mode'), // Example: title text

                    subtitle: Text('Change mode'), // Example: subtitle text

                    trailing: IconButton(
                      icon: Icon(Icons
                          .chevron_right_rounded), // Example: trailing icon button

                      onPressed: () {
                        // Action when the icon button is pressed
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Card(
                  // Optional: Set elevation to create a shadow effect

                  elevation: 4.0,

                  // Optional: Set shape to give the card rounded corners or other shapes

                  // Optional: Set color or background decoration for the card

                  color: Colors.white,

                  child: ListTile(
                    // Content of the card

                    leading: Icon(Icons.backup_outlined),

                    title: Text('Backup'), // Example: title text

                    subtitle: Text('Backup Account'), // Example: subtitle text

                    trailing: IconButton(
                      icon: Icon(Icons
                          .chevron_right_rounded), // Example: trailing icon button

                      onPressed: () {
                        // Action when the icon button is pressed
                        openAndroidBackupSettings();
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Card(
                  // Optional: Set elevation to create a shadow effect

                  elevation: 4.0,

                  // Optional: Set shape to give the card rounded corners or other shapes

                  // Optional: Set color or background decoration for the card

                  color: Colors.white,

                  child: ListTile(
                    // Content of the card

                    leading: Icon(Icons.settings),

                    title: Text('Settings'), // Example: title text

                    subtitle: Text('Manage Settings'), // Example: subtitle text

                    trailing: IconButton(
                      icon: Icon(Icons
                          .chevron_right_rounded), // Example: trailing icon button

                      onPressed: () {
                        // Action when the icon button is pressed
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Card(
                  // Optional: Set elevation to create a shadow effect

                  elevation: 4.0,

                  // Optional: Set shape to give the card rounded corners or other shapes

                  // Optional: Set color or background decoration for the card

                  color: Colors.white,

                  child: ListTile(
                    // Content of the card

                    leading: Icon(Icons.block),

                    title: Text('Settings'), // Example: title text

                    subtitle: Text('Manage Settings'), // Example: subtitle text

                    trailing: IconButton(
                      icon: Icon(Icons
                          .chevron_right_rounded), // Example: trailing icon button

                      onPressed: () {
                        // Action when the icon button is pressed
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
             
            ],
          ),
        ));
  }
}
