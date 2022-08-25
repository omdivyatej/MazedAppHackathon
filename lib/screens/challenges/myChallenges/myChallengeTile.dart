import 'package:flutter/material.dart';
import 'package:mazed_health_app/models/my_challenges.dart';

class MyChallengeTile extends StatelessWidget {
  const MyChallengeTile({Key? key, required this.myChallenges}) : super(key: key);
  final MyChallenges? myChallenges;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          title:
          Text(myChallenges != null ? myChallenges!.title.toString() : "No name"),
          subtitle: Text(myChallenges != null ?myChallenges!.reward.toString():"G"),
        ),
      ),
    );
  }
}
