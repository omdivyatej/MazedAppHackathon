import 'package:flutter/material.dart';
import 'package:mazed_health_app/screens/authentication/login.dart';

import 'package:mazed_health_app/screens/authentication/signup.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  late bool showSignIn=true;
  void toggleView(){
    setState(() {
      showSignIn=!showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return LogInPage(toggleView:toggleView);
    }else{
      return SignUp(toggleView:toggleView);
    }
  }
}
