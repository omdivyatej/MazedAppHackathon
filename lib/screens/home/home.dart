import 'package:flutter/material.dart';
import 'package:mazed_health_app/screens/home/basic_data.dart';
import 'package:mazed_health_app/screens/home/challenges_button.dart';
import 'package:mazed_health_app/screens/home/leaderboard_dummy.dart';
import 'package:mazed_health_app/screens/home/rewards_button.dart';
import 'package:mazed_health_app/services/auth.dart';
import 'package:mazed_health_app/services/database.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _authService=AuthService();
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<UserModel?>(context,listen: true);
    print(user!.uid);
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        actions: [
          IconButton(
              onPressed: ()async{
            await _authService.signOutUser();
          }, icon: const Icon(Icons.power_settings_new)),
        ],
      ),
      body: Column(
        children: const [
          BasicData(),
          ChallengesButton(),
          RewardsButton(),
          LeaderboardDummy(),

        ],
      ),
    );
  }
}
