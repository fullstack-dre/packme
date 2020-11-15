import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pack_me/ui/app/userHome.dart';
import 'package:pack_me/ui/authentication/landing.dart';
import 'package:pack_me/ui/models/user.dart';
import 'package:provider/provider.dart';

class LoginDecider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Pengguna>(context);
    print(user);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return Landing();
    } else {
      return UserHome();
    }
  }
}