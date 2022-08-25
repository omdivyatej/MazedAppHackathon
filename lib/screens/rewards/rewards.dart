import 'package:flutter/material.dart';

class Rewards extends StatefulWidget {
  const Rewards({Key? key}) : super(key: key);

  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Rewards"),
            bottom: const TabBar(
              tabs: [
                Tab(text: "All Rewards"),
                Tab(text: "My Rewards"),
              ],
            ),
          ),
          body: const TabBarView(children: [
            Text("All Rewards"),
            Text("My Rewards"),
          ]),
        ));
  }
}
