import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;

import '../Models/MatchDataModel.dart';
class FixtureDataProvider extends ChangeNotifier{
  List<MatchData> _matches = [];
  double _progress =0;
  double get getProgress{
    return _progress;
  }
  List<MatchData> get getMatches{
    return _matches;
}

Future <List<MatchData>> getMatchesData({required String url})async{
    await fetchFixture(leagueUrl: url);
    return _matches;
}


  Future<void> fetchProgress({required String url})async{
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final responseBody = response.body;
        dom.Document html = dom.Document.html(responseBody);
        final test = html.querySelector('._tag-header__progress-bar_1ab0m_114');
        _progress = double.parse(test!.attributes['value'] ?? '0') /100;
       // //print(test!.attributes['value']);
      } else {
        //print('Request failed with status: ${response.statusCode}');
      }
      ChangeNotifier();
      notifyListeners();
    } catch (e) {
      //print('Error: $e');
    }
  }
  Future<void> fetchFixture({required String leagueUrl}) async {
    final url = '${leagueUrl}fixtures/';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
       try{
         final responseBody = response.body;
         dom.Document html = dom.Document.html(responseBody);
         final test = html.querySelector('.LeagueFixturesPage_league-fixtures-page__matches__zUzhp')!.children;
         _matches.clear();
         test.forEach((element) {
           bool isMachCard =  element.getElementsByClassName("MatchWidget_match-widget__team-name__voh7Q").length == 2;
           final currentMinute =element.getElementsByClassName("MatchWidget_match-widget__current-minute__vt9q_");
           if (isMachCard) {
             _matches.add(MatchData(
               team1: element.getElementsByClassName("MatchWidget_match-widget__team-name__voh7Q")[0].text??'',
               team2: element.getElementsByClassName("MatchWidget_match-widget__team-name__voh7Q")[1].text??'',
               team1Logo: element.getElementsByClassName("MatchWidget_match-widget__logo___xKOy")[0].attributes['src'] ?? '',
               team2Logo: element.getElementsByClassName("MatchWidget_match-widget__logo___xKOy")[1].attributes['src'] ?? '',
               matchTime: editDate(timeString:element.getElementsByClassName("MatchWidget_match-widget__match-status-caption__W_pjS")[0].text)??'',
               isLive:  currentMinute.isNotEmpty,
               team1Score: currentMinute.isNotEmpty ? element.getElementsByClassName("MatchWidget_match-widget__score__GMNHr")[0].text:'',
               team2Score: currentMinute.isNotEmpty ? element.getElementsByClassName("MatchWidget_match-widget__score__GMNHr")[1].text:'',
               currentMinute: currentMinute.isNotEmpty ? currentMinute[0].text:'0',
               footer: element.getElementsByClassName("MatchWidget_match-widget__description__vQBVT")[0].text??'',
               statisticsLink: 'https://tribuna.com/${element.getElementsByClassName("MatchWidget_match-widget__teams-wrapper__PzfLe")[0].attributes['href']!}'??'',
             ));
           }
         });

       } catch (e){
         print(e.toString());
       }
        ChangeNotifier();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }

  }
  String editDate ({required timeString}){
    try {
      List<String> timeParts = timeString.split(':');
      int currentHour = int.parse(timeParts[0]);
      int currentMinute = int.parse(timeParts[1]);
      currentHour += 3;
      currentHour = currentHour % 24;
      String updatedTime = "${currentHour.toString().padLeft(2, '0')}:${currentMinute.toString().padLeft(2, '0')}";
      return updatedTime;
    } on Exception catch (e) {
      return timeString;
    }
  }
}