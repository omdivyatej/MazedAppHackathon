import 'package:flutter/material.dart';
import 'package:mazed_health_app/models/user_model.dart';
import 'package:mazed_health_app/screens/authentication/authentication.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<UserModel?>(context,listen: true);
    print(user);
    if(user==null){
      return const Authenticate();
    }else{
      return const Home();
    }
  }
}
