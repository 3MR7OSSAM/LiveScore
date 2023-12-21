import 'package:flutter/material.dart';
import 'package:live_soccer/Views/Components/Widgets/TableHeadWidget.dart';
import 'package:live_soccer/Views/Components/Widgets/shimmerLoding.dart';
import 'package:provider/provider.dart';
import '../../Services/Methods/btm_alert.dart';
import '../../Services/Models/LeagueModel.dart';
import '../../Services/Providers/FixtureDataProvider.dart';
import '../../Services/Providers/LeagueTableProvider.dart';
import '../Components/Widgets/CustomAppBar.dart';
import '../Components/Widgets/LeagueBanner.dart';
import '../Components/Widgets/MatchCardWidget.dart';
import '../Components/Widgets/TeamTableWidget.dart';
import '../MatchStatView/MatchStatView.dart';
import '../MatchesView/MatchesView.dart';

class LeagueData extends StatefulWidget {
  const LeagueData({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<LeagueData> createState() => _LeagueDataState();
}

class _LeagueDataState extends State<LeagueData> {
  bool doneLoading = true; // Add a boolean flag to track loading state

  @override
  void initState() {
    final matchesProvider = Provider.of<FixtureDataProvider>(context,listen:  false);
    final tableProvider = Provider.of<LeagueTableProvider>(context,listen:  false);
    Future.delayed(const Duration(seconds: 1), () async{
          doneLoading = true; // Set the loading flag to false after the delay
        await matchesProvider.fetchProgress(url: leaguesList[widget.index].leagueUrl);
        await  matchesProvider.getMatchesData(url: leaguesList[widget.index].leagueUrl);
        await tableProvider.getTableTeamData(url: leaguesList[widget.index].leagueUrl);
          doneLoading = false; // Set the loading flag to false after the delay
        

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final matchesProvider = Provider.of<FixtureDataProvider>(context);
    final tableProvider = Provider.of<LeagueTableProvider>(context);
    final table = tableProvider.getMatchesTable;
    double progress = matchesProvider.getProgress;
    final matches = matchesProvider.getMatches;
    return SafeArea(
      child: WillPopScope(
        onWillPop: ()async{
          table.clear();
          matches.clear();
          progress = 0;
          return true;
        },
        child: Scaffold(
          body:  Container(
            color: Colors.black12.withOpacity(0.7),
            height: double.infinity,
            child:  SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const CustomAppBar(isMain: false,),
                        const SizedBox(height: 20,),
                        LeagueBanner(progress: progress,
                          isMain: true,
                          image: leaguesList[widget.index].image,
                          title: leaguesList[widget.index].title,
                          )
                      ],
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text('Upcomming Matches',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Barclays Premier League',
                              color: Colors.white,
                            )),
                        const Spacer(),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const MatchesView()));
                          },
                          child: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:  10 ,
                        itemBuilder: (builder, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: (){
                                if (matches[index].isLive) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                      MatchStatView(matchUrl: matches[index].statisticsLink, team1Name: matches[index].team1, team2Name: matches[index].team2, team1Logo: matches[index].team1Logo, team2Logo: matches[index].team2Logo,)));
                                }else{
                                  showBtmAlert(context,"Match Hasn't Started Yet");
                                }

                              },
                              child: doneLoading ? ShimmerLoading(child: Container(
                                height: 100,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16)
                                ),
                              ),) :MatchCardWidget(
                                team1Logo: matches[index].team1Logo,
                                team2Logo: matches[index].team2Logo,
                                team1Name: matches[index].team1,
                                team2Name: matches[index].team2,
                                time: matches[index].matchTime,
                                footer: matches[index].footer,
                              ),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text('League Table',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                        Spacer(),

                      ],
                    ),
                  ),
                  const TableHead(),
                  const SizedBox(
                    height: 5,
                  ),
                  doneLoading ? ShimmerLoading(child: Container(
                    height: 260,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)
                    ),
                  ),) : SizedBox(
                    height: 260,
                    child: table.isNotEmpty ? ListView.builder(
                        itemCount: table.length,
                        itemBuilder: (builder, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10),
                            child: TeamTableWidget(
                              team: table[index].teamName,
                              points: table[index].teamPoints,
                              matches: table[index].teamMatches,
                              wins: table[index].teamWins,
                              losses: table[index].teamLoses,
                              gfGA: table[index].teamGoalDifferences,
                              index: index + 1,
                              draws: table[index].teamDraws,
                            ),
                          );
                        }):Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:  Colors.black12.withOpacity(0.4),
                      ),
                      width: double.infinity,
                      height: 200,
                    ),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


