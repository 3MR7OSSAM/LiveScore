import 'package:flutter/material.dart';

class StatCardWidget extends StatelessWidget {
  const StatCardWidget({Key? key, required this.team1Stat, required this.team2Stat, required this.title}) : super(key: key);
  final String team1Stat;
  final String team2Stat;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black12.withOpacity(0.2),
        ),
        width:double.infinity,
        height: 40,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(team1Stat,style: const TextStyle(color: Colors.white,fontSize: 14),),
              Text(title,style: const TextStyle(color: Colors.white,fontSize: 14),),
              Text(team2Stat,style: const TextStyle(color: Colors.white,fontSize: 14),),
            ],
          ),
        ),
      ),
    );
  }
}
