import 'package:firebase_auth/firebase_auth.dart';

class UserProfile {
  final String number;

  UserProfile(this.number);
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserProfile> getUserProfile() async {
    User? user = _auth.currentUser;

    if (user != null) {
      var user = FirebaseAuth.instance.currentUser;
      String pn = user!.phoneNumber.toString();
      print("user_phone_number " + pn);
    }

    throw Exception('User not found');
  }
}
