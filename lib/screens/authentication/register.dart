import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mazed_health_app/services/auth.dart';
import 'package:mazed_health_app/services/database.dart';
import 'package:mazed_health_app/shared/constants.dart';
import 'package:mazed_health_app/theme/app_colors.dart';

class RegisterUser extends StatefulWidget {
  final Function toggleView;
  const RegisterUser({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
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
        title: const Text("Register"),
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
                        await _authService.registerUser(email, password);
                    FirebaseAuth.instance.signOut();

                    if (result == null) {
                      print("Error");
                      setState(() {
                        error = "Please supply a valid email";
                      });
                    }
                  }
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Register"),
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
              }, child: const Text("Already a user? Login"))
            ],
          ),
        ),
      ),
    );
  }
}
