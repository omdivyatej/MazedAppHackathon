import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';

class BasicData extends StatefulWidget {
  const BasicData({Key? key}) : super(key: key);

  @override
  State<BasicData> createState() => _BasicDataState();
}

class _BasicDataState extends State<BasicData> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context, listen: true);
    final basicData = Provider.of<UserData?>(context, listen: true);
    //print("User is ${user!.uid}");
    //print("${basicData} is shit ");
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            basicData != null
                ? "Hey ${basicData.name}. Good Morning!"
                : "No user found!",
            style: const TextStyle(
              fontSize: 20.0,
              letterSpacing: 1,
            ),
          ),//Name
          Text(
            basicData != null ? "Secret code: ${user!.uid}" : "No user found!",
            style: const TextStyle(
              fontSize: 15.0,
              letterSpacing: 0,
            ),
          ),//Secret Code
          Text(
            basicData != null
                ? "Total Coins: ${basicData.totalCoins}"
                : "No user found!",
            style: const TextStyle(
              fontSize: 15.0,
              letterSpacing: 0,
            ),
          ),//total Coins
          Text(
            basicData != null ? "Level: ${basicData.level}" : "No user found!",
            style: const TextStyle(
              fontSize: 15.0,
              letterSpacing: 0,
            ),
          )//level
        ],
      ),
    );
  }
}
//rZ7xk6kWgXcSjtFZ5BVr401bEQr2
