import 'package:flutter/material.dart';
import '../Models/MatchStatsModel.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;

class MatchStatisticsProvider extends ChangeNotifier {
  Future<MatchStats?> matchStatistics({required String matchUrl}) async {
    try {
      final response = await http.get(Uri.parse(matchUrl));
      if (response.statusCode == 200) {
        final responseBody = response.body;
        dom.Document html = dom.Document.html(responseBody);
        final stats = html.querySelector('.Statistics_online-statistics__info-bars__5UNzh')!.children;
        final scoreBord = html.querySelector('.OnlineHeader_online-header__score__3k7xo')!.children;
        final timeBord = html.getElementsByClassName('OnlineHeader_online-header__current-minute__eF3Sv');
        final MatchStats matchStats = MatchStats(
          scoreTeam1: scoreBord[0].text,
          scoreTeam2: scoreBord[1].text,
          possessionTeam1: stats[0].querySelector('.Statistics_info-bar__stat-bar-wrapper__mTvDA')!.children[0].text,
          possessionTeam2: stats[0].querySelector('.Statistics_info-bar__stat-bar-wrapper__mTvDA')!.children[2].text,
          shotsOnTargetTeam1: stats[1].querySelector('.Statistics_info-bar__stat-bar-wrapper__mTvDA')!.children[0].text,
          shotsOnTargetTeam2: stats[1].querySelector('.Statistics_info-bar__stat-bar-wrapper__mTvDA')!.children[2].text,
          shotsOffTargetTeam1: stats[2].querySelector('.Statistics_info-bar__stat-bar-wrapper__mTvDA')!.children[0].text,
          shotsOffTargetTeam2: stats[2].querySelector('.Statistics_info-bar__stat-bar-wrapper__mTvDA')!.children[2].text,
          foulsTeam1: stats[3].querySelector('.Statistics_info-bar__stat-bar-wrapper__mTvDA')!.children[0].text,
          foulsTeam2: stats[3].querySelector('.Statistics_info-bar__stat-bar-wrapper__mTvDA')!.children[2].text,
          cornerKicksTeam1: stats[4].querySelector('.Statistics_info-bar__stat-bar-wrapper__mTvDA')!.children[0].text,
          cornerKicksTeam2: stats[4].querySelector('.Statistics_info-bar__stat-bar-wrapper__mTvDA')!.children[2].text,
          freeKicksTeam1: stats[5].querySelector('.Statistics_info-bar__stat-bar-wrapper__mTvDA')!.children[0].text,
          freeKicksTeam2: stats[5].querySelector('.Statistics_info-bar__stat-bar-wrapper__mTvDA')!.children[2].text,
          offsidesTeam1: stats[6].querySelector('.Statistics_info-bar__stat-bar-wrapper__mTvDA')!.children[0].text,
          offsidesTeam2: stats[6].querySelector('.Statistics_info-bar__stat-bar-wrapper__mTvDA')!.children[2].text,
          currentTime:timeBord[0].text,
        );
        notifyListeners();
        return matchStats;
      }
      // Return null if the HTTP request fails
      return null;
    } catch (e) {
      //print(e.toString());
      // Return null in case of an exception
      return null;
    }
  }
}
