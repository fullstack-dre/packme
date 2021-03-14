import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pack_me/pages/pages.dart';
import 'package:pack_me/services/services.dart';
import 'package:provider/provider.dart';

class AuthenticationWrapper extends StatefulWidget {
  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  @override
  Widget build(BuildContext context){
    return StreamBuilder<User>(
      stream: Provider.of<AuthenticationService>(context, listen: true).userState,
      builder: (context, snapshot){
        if(Provider.of<AuthenticationService>(context).isSigningIn == true){
          return Text("Loading");
        }
        else if (!snapshot.hasData){
          if (Provider.of<SharedPref>(context, listen: true).isFirstTime == true) {
            return OnboardingPages();
          } else {
            return CTAAuthPage();
          }
        } else {
          return HomePage();
        }
      },
    );
  }
}