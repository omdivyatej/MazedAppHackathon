import 'package:flutter/material.dart';


class RewardsButton extends StatefulWidget {
  const RewardsButton({Key? key}) : super(key: key);

  @override
  State<RewardsButton> createState() => _RewardsButtonState();
}

class _RewardsButtonState extends State<RewardsButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

        onPressed: () {

          Navigator.pushNamed(context, '/rewardsScreen');

        },
        child: const Text("Rewards"));
  }
  }

