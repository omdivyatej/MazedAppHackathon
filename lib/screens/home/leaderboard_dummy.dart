import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mazed_health_app/screens/home/leaderboard_model.dart';
import 'package:mazed_health_app/screens/home/leaderboard_tile.dart';
import 'package:provider/provider.dart';

class LeaderboardDummy extends StatefulWidget {
  const LeaderboardDummy({Key? key}) : super(key: key);

  @override
  State<LeaderboardDummy> createState() => _LeaderboardDummyState();
}

class _LeaderboardDummyState extends State<LeaderboardDummy> {
  @override
  Widget build(BuildContext context) {
    final leaderboard = Provider.of<List<Leaderboard?>?>(context,listen:true);
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: leaderboard!=null?leaderboard.length:1,
        itemBuilder: (context,index){
          return LeaderboardTile(leaderboardUser: leaderboard!=null?leaderboard[index]:Leaderboard(userName: "Loading Learderboard"));
        },
    );
  }
}
