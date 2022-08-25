import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mazed_health_app/models/rewards_model.dart';
import 'package:mazed_health_app/models/user_model.dart';
import 'package:mazed_health_app/screens/challenges/challenges.dart';
import 'package:mazed_health_app/screens/home/leaderboard_model.dart';
import 'package:mazed_health_app/screens/rewards/rewards.dart';
import 'package:mazed_health_app/screens/wrapper.dart';
import 'package:mazed_health_app/services/auth.dart';
import 'package:mazed_health_app/services/database.dart';
import 'package:provider/provider.dart';

import 'models/challenges.dart';
import 'models/my_challenges.dart';
//this is a comment

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      StreamProvider.value(
        value: AuthService().authChange,
        initialData: null,
        catchError: (_, __) => null,
      ),
      StreamProvider<UserModel?>.value(
        value: AuthService().authChange,
        initialData: null,
        catchError: (_, __) => null,
      ),
      StreamProvider<UserData?>.value(
        value: DatabaseService(uid: FirebaseAuth.instance.currentUser!=null? FirebaseAuth.instance.currentUser!.uid:null.toString())
            .userHomeData,
        initialData: null,
        catchError: (_, __) => null,
      ),
      StreamProvider<List<Leaderboard?>?>.value(
        value: DatabaseService(uid: "").listOfUserNameRanking,
        initialData: null,
        catchError: (_, __) => null,
      ),
      StreamProvider<List<Challenge?>?>.value(
        value: DatabaseService(uid:  FirebaseAuth.instance.currentUser!=null? FirebaseAuth.instance.currentUser!.uid:null.toString())
            .allChallengesStream2,
        initialData: null,
        catchError: (_, __) => null,
      ),
      StreamProvider<List<MyChallenges?>?>.value(
        value: DatabaseService(uid:  FirebaseAuth.instance.currentUser!=null? FirebaseAuth.instance.currentUser!.uid:null.toString())
            .myChallengesStream,
        initialData: null,
        catchError: (_, __) => null,
      )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Wrapper(),
      routes: {
        '/challengesScreen': (context) => Challenges(),
        '/rewardsScreen':(context) => Rewards(),
      },
    ),
  ));
}
