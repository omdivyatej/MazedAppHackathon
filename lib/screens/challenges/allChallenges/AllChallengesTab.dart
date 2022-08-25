import 'package:flutter/material.dart';
import 'package:mazed_health_app/screens/challenges/allChallenges/helper.dart';

class AllChallengesTab extends StatefulWidget {
  const AllChallengesTab({Key? key}) : super(key: key);

  @override
  State<AllChallengesTab> createState() => _AllChallengesTabState();
}

class _AllChallengesTabState extends State<AllChallengesTab> {
  @override
  Widget build(BuildContext context) {
    return const HelperChallenger();
  }
}
