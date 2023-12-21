import 'package:flutter/material.dart';

class TeamTableWidget extends StatelessWidget {
  const TeamTableWidget({Key? key, required this.team, required this.points, required this.matches, required this.wins, required this.losses, required this.gfGA, required this.index, required this.draws}) : super(key: key);
  final int index;
  final String team;
  final String points;
  final String matches;
  final String wins;
  final String draws;
  final String losses;
 // final String goalDifferance;
  final String gfGA;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1,bottom: 1),
      child: Container(
        height: 35,
        width: MediaQuery.sizeOf(context).width *.98,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:  Colors.black12.withOpacity(0.4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('$index |',style: const TextStyle(color: Colors.white),),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width *.4,
                  child: Text(' $team',style: const TextStyle(color: Colors.white),maxLines: 1,)),
              const Spacer(),
              SizedBox(
                width: MediaQuery.sizeOf(context).width *.37,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(points,style: const TextStyle(color: Colors.white),),
                    Text(matches,style: const TextStyle(color: Colors.white),),
                    Text(wins,style: const TextStyle(color: Colors.white),),
                    Text(draws,style: const TextStyle(color: Colors.white),),
                    Text(losses,style: const TextStyle(color: Colors.white),),
                    Text(gfGA,style: const TextStyle(color: Colors.white),),
                    const SizedBox(width: 1,)
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
