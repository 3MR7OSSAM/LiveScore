class LeagueModel {
  LeagueModel({
   required this.title,
   required this.image,
   required this.leagueUrl,

});
  String title;
  String image;
  String leagueUrl;
}
List<LeagueModel> leaguesList = [
  LeagueModel(title: 'Premier League', image: 'assests/LeagueIcons/PremieLleague.png', leagueUrl: 'https://tribuna.com/en/league/epl/'),
  LeagueModel(title: 'La Liga', image: 'assests/LeagueIcons/LaLiga.png', leagueUrl: 'https://tribuna.com/en/league/la-liga/'),
  LeagueModel(title: 'Ligue 1', image: 'assests/LeagueIcons/Ligue1.png', leagueUrl: 'https://tribuna.com/en/league/ligue-1/'),
  LeagueModel(title: 'Bundesliga', image: 'assests/LeagueIcons/Bundesliga.png', leagueUrl: 'https://tribuna.com/en/league/bundesliga/'),
  LeagueModel(title: 'Serie A', image: 'assests/LeagueIcons/SerieA.png', leagueUrl: 'https://tribuna.com/en/league/seria-a/'),
  LeagueModel(title: 'Champions League', image: 'assests/LeagueIcons/championsLeague.png', leagueUrl: 'https://tribuna.com/en/league/ucl/'),
  LeagueModel(title: 'Egyptian League ', image: 'assests/LeagueIcons/Egyptian_Premier_League.png', leagueUrl: 'https://tribuna.com/en/league/egyptian-premier-league/'),
  LeagueModel(title: 'Saudi Pro League', image: 'assests/LeagueIcons/RoshnSaudiLeague.png.png', leagueUrl: 'https://tribuna.com/en/league/saudi-prof-league/'),
];