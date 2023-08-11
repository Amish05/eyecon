import 'package:eyecon/user_detials.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class loginPage extends StatelessWidget {
  loginPage({super.key});
  late String _phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("EyeCon"),
          IntlPhoneField(
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              hintText: '300 0000000',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            initialCountryCode: 'PK', //default contry code, PK for Pakistan
            onChanged: (phone) {
              _phoneNumber = phone.completeNumber;
            },
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => user_detials()));
              },
              child: const Text("Login"))
        ],
      ),
    );
  }
}
