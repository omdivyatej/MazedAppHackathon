import 'package:flutter/material.dart';
import 'package:mazed_health_app/screens/challenges/myChallenges/HelperMyChallenger.dart';

class MyChallengesTab extends StatefulWidget {
  const MyChallengesTab({Key? key}) : super(key: key);

  @override
  State<MyChallengesTab> createState() => _MyChallengesTabState();
}

class _MyChallengesTabState extends State<MyChallengesTab> {
  @override
  Widget build(BuildContext context) {
    return HelperMyChallenger();
  }
}
