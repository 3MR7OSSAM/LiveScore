class MatchStats{
  String scoreTeam1;
  String scoreTeam2;
  String shotsOnTargetTeam1;
  String shotsOnTargetTeam2;
  String possessionTeam1;
  String possessionTeam2;
  String shotsOffTargetTeam1;
  String shotsOffTargetTeam2;
  String foulsTeam1;
  String foulsTeam2;
  String cornerKicksTeam1;
  String cornerKicksTeam2;
  String freeKicksTeam1;
  String freeKicksTeam2;
  String offsidesTeam1;
  String offsidesTeam2;
  String currentTime;
  MatchStats({
    required this.scoreTeam1,
    required this.scoreTeam2,
    required this.possessionTeam1,
    required this.possessionTeam2,
    required this.shotsOnTargetTeam1,
    required this.shotsOnTargetTeam2,
    required this.shotsOffTargetTeam1,
    required this.shotsOffTargetTeam2,
    required this.foulsTeam1,
    required this.foulsTeam2,
    required this.cornerKicksTeam1,
    required this.cornerKicksTeam2,
    required this.freeKicksTeam1,
    required this.freeKicksTeam2,
    required this.offsidesTeam1,
    required this.offsidesTeam2,
    required this.currentTime
  });
}
