import 'package:flutter/material.dart';

import '../../HomeView/widgets/CustomNetworkImage.dart';

class MatchCardWidget extends StatelessWidget {
  const MatchCardWidget({Key? key, required this.team1Logo, required this.team2Logo, required this.team1Name, required this.team2Name, required this.time, required this.footer}) : super(key: key);
  final String team1Logo;
  final String team2Logo;
  final String team1Name;
  final String team2Name;
  final String time;
  final String footer;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 235,
      decoration: BoxDecoration(
          color: Colors.black12.withOpacity(0.4),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CustomNetworkImage(imageUrl: team1Logo,isMain: false, showTitle: false,),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: SizedBox(
                          width:55,
                          child: Text(
                            team1Name,style: const TextStyle(fontSize: 10,color: Colors.white),maxLines: 2,textAlign: TextAlign.center,overflow:TextOverflow.clip),
                        ),
                      ) ,
                    ],

                  ),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 60,
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(time,style: const TextStyle(fontSize: 16,color: Colors.white),maxLines: 1,overflow: TextOverflow.fade,))),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child:  CustomNetworkImage(imageUrl: team2Logo,isMain: false, showTitle: false,),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: SizedBox(
                          width:55,
                          child: Text(
                            team2Name,style: const TextStyle(fontSize: 10,color: Colors.white),maxLines: 2,textAlign: TextAlign.center,overflow:TextOverflow.clip ,),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
             Text(
              footer,style: const TextStyle(fontSize: 8,color: Colors.white),maxLines: 2,textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
