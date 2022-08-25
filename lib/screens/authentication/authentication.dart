import 'package:flutter/material.dart';
import 'package:mazed_health_app/screens/authentication/register.dart';
import 'package:mazed_health_app/screens/authentication/sign_in.dart';

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
      return SignIn(toggleView:toggleView);
    }else{
      return RegisterUser(toggleView:toggleView);
    }
  }
}
