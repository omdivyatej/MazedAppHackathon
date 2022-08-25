import 'package:flutter/material.dart';
import 'package:mazed_health_app/models/challenges.dart';
import 'package:mazed_health_app/services/database.dart';
import 'package:provider/provider.dart';

import '../../../models/user_model.dart';

class ChallengeTile extends StatelessWidget {
  const ChallengeTile({Key? key, required this.challenge}) : super(key: key);
  final Challenge? challenge;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                  challenge != null ? challenge!.title.toString() : "No name"),
              subtitle: Text(challenge != null
                  ? " level is ${challenge!.level! <= 2 ? (challenge!.level ==
                  2) ? "Medium" : "Easy" : "Difficult"} !"
                  : "No value"),
            ),
            ElevatedButton(onPressed: () async {
              await DatabaseService(uid: user!.uid).joinChallenge(
                  challenge!.title.toString(),
                  challenge!.description.toString()
              );
            }, child: Text("join")),
          ],
        ),
      ),
    );
  }
}
