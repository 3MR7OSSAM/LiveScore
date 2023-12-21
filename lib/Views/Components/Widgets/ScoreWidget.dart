import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({Key? key, required this.score,}) : super(key: key);
  final String score;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.black12.withOpacity(0.5)),
      child:  Center(
          child: FittedBox(
            child: Text(
              score,
              style: const TextStyle(
                  color: Colors.white, fontSize: 18),
            ),
          )),
    );
  }
}
