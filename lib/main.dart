
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Services/Providers/FixtureDataProvider.dart';
import 'Services/Providers/LeagueTableProvider.dart';
import 'Services/Providers/MatchStatisticsProvider.dart';
import 'Services/Providers/NewsProvider.dart';
import 'Views/HomeView/HomeView.dart';
import 'Views/LeagueData/LeagueDataView.dart';
import 'Views/MatchStatView/MatchStatView.dart';
import 'Views/SplashView/SplashView.dart';
void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return  MultiProvider(
     
      providers: [
        ChangeNotifierProvider(create: (_){
          return FixtureDataProvider();
        }) ,
        ChangeNotifierProvider(create: (_){
          return LeagueTableProvider();
        }) ,
        ChangeNotifierProvider(create: (_){
          return MatchStatisticsProvider();
        }),
        ChangeNotifierProvider(create: (_){
          return NewsProvider();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Barclays Premier League'
        ),
        home: const SplashViewPage(),
      ),
    );
  }
}
