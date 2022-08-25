import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../models/challenges.dart';

import 'challenge_tile.dart';

class HelperChallenger extends StatefulWidget {
  const HelperChallenger({Key? key}) : super(key: key);

  @override
  State<HelperChallenger> createState() => _HelperChallengerState();
}

class _HelperChallengerState extends State<HelperChallenger> {
  @override
  Widget build(BuildContext context) {
    final challenges = Provider.of<List<Challenge?>?>(context, listen: true);
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount:  challenges!=null?challenges.length:1,
        itemBuilder: (context, index) {
          print(challenges);

          // Challenge challenge = challenges!=null?challenges[index];
          return ChallengeTile(challenge: challenges!=null?challenges[index]:null);
        });
  }
}
