import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Services/Models/MatchStatsModel.dart';
import '../../Services/Providers/MatchStatisticsProvider.dart';
import '../Components/Widgets/CustomAppBar.dart';
import '../Components/Widgets/LivePointWidget.dart';
import '../Components/Widgets/LoadingView.dart';
import '../Components/Widgets/ScoreWidget.dart';
import '../Components/Widgets/StatCardWidget.dart';
import '../Components/Widgets/TeamImageStat.dart';

class MatchStatView extends StatefulWidget {
  const MatchStatView(
      {Key? key,
      required this.matchUrl,
      required this.team1Name,
      required this.team2Name,
      required this.team1Logo,
      required this.team2Logo})
      : super(key: key);
  final String matchUrl;
  final String team1Name;
  final String team2Name;
  final String team1Logo;
  final String team2Logo;

  @override
  State<MatchStatView> createState() => _MatchStatViewState();
}

class _MatchStatViewState extends State<MatchStatView> {
  late MatchStats matchStats;
  bool isLoading = true;
  late Timer _timer;

  @override
  void initState() {
    fetchMatchStats();
    _timer = Timer.periodic(const Duration(seconds: 15), (timer) {
      fetchMatchStats(); // Fetch data every 20 seconds
      print('Hi workingggg');
    });
    super.initState();
  }

  void fetchMatchStats() async {
    final matchStatProvider =
        Provider.of<MatchStatisticsProvider>(context, listen: false);
    final stats =
        await matchStatProvider.matchStatistics(matchUrl: widget.matchUrl);
    setState(() {
      isLoading = false;
      matchStats = stats ??
          MatchStats(
              possessionTeam1: '0',
              possessionTeam2: '0',
              shotsOnTargetTeam1: '0',
              shotsOnTargetTeam2: '0',
              shotsOffTargetTeam1: '0',
              shotsOffTargetTeam2: '0',
              foulsTeam2: '0',
              foulsTeam1: '0',
              cornerKicksTeam1: '0',
              cornerKicksTeam2: '0',
              freeKicksTeam2: '0',
              freeKicksTeam1: '0',
              offsidesTeam1: '0',
              offsidesTeam2: '0',
              scoreTeam1: '0',
              scoreTeam2: '0',
              currentTime: '00'); // Provide default values if null
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const LoadingViewWidget(
                showTitle: true,
              )
            : Container(
                color: Colors.black12.withOpacity(0.7),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const CustomAppBar(
                        isMain: false,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        height: height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.black12.withOpacity(0.3),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  StatTeamImage(
                                    name: widget.team1Name,
                                    imageUrl: widget.team1Logo,
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          ScoreWidget(
                                            score: matchStats.scoreTeam1,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              ":",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30),
                                            ),
                                          ),
                                          ScoreWidget(
                                            score: matchStats.scoreTeam2,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        matchStats.currentTime,
                                        style: const TextStyle(
                                            color: Colors.red,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 14),
                                      ),
                                      LivePoint(),
                                    ],
                                  ),
                                  const Spacer(),
                                  StatTeamImage(
                                    name: widget.team2Name,
                                    imageUrl: widget.team2Logo,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      StatCardWidget(
                        team1Stat: matchStats.possessionTeam1,
                        team2Stat: matchStats.possessionTeam2,
                        title: 'Possession',
                      ),
                      StatCardWidget(
                        team1Stat: matchStats.shotsOnTargetTeam1,
                        team2Stat: matchStats.shotsOnTargetTeam2,
                        title: 'Shots on target',
                      ),
                      StatCardWidget(
                        team1Stat: matchStats.shotsOffTargetTeam1,
                        team2Stat: matchStats.shotsOffTargetTeam2,
                        title: 'Shots off target',
                      ),
                      StatCardWidget(
                        team1Stat: matchStats.foulsTeam1,
                        team2Stat: matchStats.foulsTeam2,
                        title: 'Fouls',
                      ),
                      StatCardWidget(
                        team1Stat: matchStats.cornerKicksTeam1,
                        team2Stat: matchStats.cornerKicksTeam2,
                        title: 'Corner kicks',
                      ),
                      StatCardWidget(
                        team1Stat: matchStats.freeKicksTeam1,
                        team2Stat: matchStats.freeKicksTeam2,
                        title: 'Free kicks',
                      ),
                      StatCardWidget(
                        team1Stat: matchStats.offsidesTeam1,
                        team2Stat: matchStats.offsidesTeam2,
                        title: 'Offsides',
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
