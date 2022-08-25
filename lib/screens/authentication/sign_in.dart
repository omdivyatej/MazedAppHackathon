import 'package:flutter/material.dart';

import '../../services/auth.dart';
import '../../shared/constants.dart';
import '../../theme/app_colors.dart';
class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  final AuthService _authService = AuthService();
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        title: const Text("Sign In"),
        centerTitle: true,
        backgroundColor: Colors.orange[800],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Email"),
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
                validator: (val) {
                  if (val != null) {
                    if (val.isEmpty) {
                      return "Enter Email Address";
                    }
                  } else {
                    return null;
                  }
                },
              ),//Email
              const SizedBox(height: 20,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Password"),
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
                validator: (val) {
                  if (val != null) {
                    if (val.isEmpty) {
                      return "Enter a password";
                    } else {
                      return null;
                    }
                  }
                },
              ),//Password
              const SizedBox(height: 20,),
              ElevatedButton.icon(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result =
                    await _authService.signInEmandPw(email, password);
                    if (result == null) {
                      print("Error");
                      setState(() {
                        error = "Please supply a valid email";
                      });
                    }
                  }
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Sign In"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors().materialButtonColor),
                ),
              ),//Register Button
              const SizedBox(height: 20,),
              Text(
                error,
                style: const TextStyle(color: Colors.red),
              ),
              TextButton(onPressed: (){
                widget.toggleView();
              }, child: const Text("Not a user? Register!"))
            ],
          ),
        ),
      ),
    );
  }
}
