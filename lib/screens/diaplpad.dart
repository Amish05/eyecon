import 'package:flutter/material.dart';

class DialPadWidget extends StatefulWidget {
  @override
  State<DialPadWidget> createState() => _DialPadWidgetState();
}

class _DialPadWidgetState extends State<DialPadWidget> {
  late String buttonText="+92 ";

  void _changeButtonText(String label) {
    setState(() {
      if(buttonText.length <= 15)
      {
      buttonText=buttonText+label;
      }
      else if(buttonText.length == 7)
      {
        buttonText=buttonText+" ";
      }
      else {
        print("Max length reached");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding:EdgeInsets.fromLTRB(0, 0, 0, 3),
          
          child: Container(
            child: Text(buttonText),
            decoration: BoxDecoration(

              border: Border(
              bottom: BorderSide(
                color: Colors.blue, // Border color
                width: 2.0, // Border width
              ),
            ),
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDialButton(context, '1'),
              _buildDialButton(context, '2'),
              _buildDialButton(context, '3'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDialButton(context, '4'),
              _buildDialButton(context, '5'),
              _buildDialButton(context, '6'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDialButton(context, '7'),
              _buildDialButton(context, '8'),
              _buildDialButton(context, '9'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               FloatingActionButton(onPressed: (){}, child: Icon(Icons.quick_contacts_dialer),
             backgroundColor: Colors.green,
             ),
             
              _buildDialButton(context, '0'),
            
               FloatingActionButton(onPressed: (){}, child: Icon(Icons.call_rounded),
             backgroundColor: Colors.green,
             ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDialButton(BuildContext context, String label) {
    return GestureDetector(
      onTap: () {
        _onDialButtonPressed(label);
         
      },
      child: FloatingActionButton(
       
        onPressed: () { _onDialButtonPressed(label);
        
          },
        child: Text(
          label,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }

  void _onDialButtonPressed(String label) {
    // Handle dial button press here
  _changeButtonText(label);
    print('Dial button pressed: $label');
  }
}
