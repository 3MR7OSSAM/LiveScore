class MatchData {
  String team1;
  String team2;
  String team1Logo;
  String team2Logo;
  String matchTime;
  String footer;
  String statisticsLink;
  bool isLive;
  String? currentMinute;
  String? team1Score;
  String? team2Score;
  MatchData({
    required this.team1,
    required this.team2,
    required this.team1Logo,
    required this.team2Logo,
    required this.matchTime,
    required this.footer,
    required this.statisticsLink,
    required this.isLive,
    this.currentMinute,
    this.team1Score,
    this.team2Score
  });
}
