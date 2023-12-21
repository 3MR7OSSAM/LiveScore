import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Services/Providers/FixtureDataProvider.dart';
import '../Components/Widgets/CustomAppBar.dart';
import '../Components/Widgets/MatchCardWidget.dart';

class MatchesView extends StatelessWidget {
  const MatchesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final matchesProvider = Provider.of<FixtureDataProvider>(context);
    final matches = matchesProvider.getMatches;
    return SafeArea(child: Scaffold(
      body: Container(
        color: Colors.black12.withOpacity(0.7),
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(isMain: false,),
                const Padding(
                  padding: EdgeInsets.only(top: 16,bottom: 12),
                  child: Text('League Matches',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Barclays Premier League',
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                 // height: MediaQuery.sizeOf(context).height *0.8,
                  child: ListView.builder(
                      shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics(),
                      itemCount: matches.length,
                      itemBuilder: (builder , index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      child: MatchCardWidget(
                        team1Logo: matches[index].team1Logo,
                        team2Logo: matches[index].team2Logo,
                        team1Name: matches[index].team1,
                        team2Name: matches[index].team2,
                        time: matches[index].matchTime,
                        footer: matches[index].footer,
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
