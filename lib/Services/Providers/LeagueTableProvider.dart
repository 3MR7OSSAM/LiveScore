import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;

import '../Models/TableTeamDataModel.dart';
class LeagueTableProvider extends ChangeNotifier{
  List<TableTeamData> _matchesTable = [];

  Future <List<TableTeamData>> getTableTeamData({required String url})async{
    await getLeagueTable(url: '${url}table/');
    return _matchesTable;
  }


  List<TableTeamData> get getMatchesTable{
    return _matchesTable;
  }
  Future<void> getLeagueTable({required String url})async{
    final response = await http.get(Uri.parse(url));
    try {
      if(response.statusCode == 200){
        _matchesTable.clear();
        final responseBody = response.body;
        dom.Document html = dom.Document.html(responseBody);
        final table= html.querySelectorAll('._table-line_vletf_1');
        RegExp regex = RegExp(r'[A-Za-z\s]+');
        for(int i = 0; i < table.length ; i++){
          _matchesTable.add(
              TableTeamData(
                  teamName: regex.firstMatch(table[i].children[0].text)!.group(0).toString(),
                  teamPoints: table[i].children[1].text,
                  teamMatches: table[i].children[2].text,
                  teamWins: table[i].children[3].text,
                  teamDraws: table[i].children[4].text,
                  teamLoses: table[i].children[5].text,
                  teamGoals: table[i].children[6].text,
                  teamGoalDifferences: table[i].children[7].text
              )
          );
        }
        notifyListeners();
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}