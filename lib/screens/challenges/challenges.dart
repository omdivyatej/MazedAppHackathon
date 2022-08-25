import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mazed_health_app/screens/challenges/allChallenges/AllChallengesTab.dart';
import 'package:mazed_health_app/screens/challenges/myChallenges/MyChallengesTab.dart';
import 'package:mazed_health_app/services/database.dart';
import 'package:provider/provider.dart';

import '../../models/challenges.dart';

class Challenges extends StatefulWidget {
  const Challenges({Key? key}) : super(key: key);

  @override
  State<Challenges> createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
        child: Scaffold(
        appBar: AppBar(
          title: const Text("Challenges"),
          bottom: const TabBar(
              tabs: [
                Tab(text: "All Challenges"),
                Tab(text: "My Challenges"),
              ],
          ),
        ),
          body: const TabBarView(children: [
            AllChallengesTab(),
            MyChallengesTab(),
          ]),
    ));
  }
}
