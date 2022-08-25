import 'package:flutter/material.dart';
import 'package:mazed_health_app/screens/home/leaderboard_model.dart';

class LeaderboardTile extends StatelessWidget {
  final Leaderboard? leaderboardUser;
  const LeaderboardTile({Key? key, required this.leaderboardUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          title: Text(leaderboardUser!=null?leaderboardUser!.userName.toString():"No name"),
          //subtitle: Text(" level is ${challenge!.level} !"),
        ),
      ),
    );
  }
}
