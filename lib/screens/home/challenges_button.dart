import 'package:flutter/material.dart';
import 'package:mazed_health_app/screens/challenges/challenges.dart';
import 'package:mazed_health_app/services/database.dart';

class ChallengesButton extends StatefulWidget {
  const ChallengesButton({Key? key}) : super(key: key);

  @override
  State<ChallengesButton> createState() => _ChallengesButtonState();
}

class _ChallengesButtonState extends State<ChallengesButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

        onPressed: () {

        Navigator.pushNamed(context, '/challengesScreen');

        },
        child: const Text("Challenges"));
  }
}


