import 'package:flutter/material.dart';
import 'package:mazed_health_app/models/my_challenges.dart';
import 'package:mazed_health_app/screens/challenges/myChallenges/myChallengeTile.dart';
import 'package:provider/provider.dart';

class HelperMyChallenger extends StatefulWidget {
  const HelperMyChallenger({Key? key}) : super(key: key);

  @override
  State<HelperMyChallenger> createState() => _HelperMyChallengerState();
}

class _HelperMyChallengerState extends State<HelperMyChallenger> {
  @override
  Widget build(BuildContext context) {
    final myChallenges = Provider.of<List<MyChallenges?>?>(context, listen: true);
    print("hello");
    print(myChallenges);
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: myChallenges!=null?myChallenges.length:1,
        itemBuilder: (context, index) {
          print(myChallenges);

          // Challenge challenge = challenges!=null?challenges[index];
          return MyChallengeTile(myChallenges:myChallenges!=null?myChallenges[index]:null);
        });
  }
}
