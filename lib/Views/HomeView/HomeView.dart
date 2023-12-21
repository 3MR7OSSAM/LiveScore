import 'package:flutter/material.dart';
import 'package:live_soccer/Services/Models/LeagueModel.dart';
import 'package:live_soccer/Views/Components/Widgets/LeagueBanner.dart';
import 'package:live_soccer/Views/HomeView/widgets/NewsItemWidget.dart';
import 'package:provider/provider.dart';
import '../../Services/Providers/NewsProvider.dart';
import '../Components/Widgets/CustomAppBar.dart';
import '../LeagueData/LeagueDataView.dart';
import '../NewsView/NewsContentView.dart';
import '../NewsView/NewsViewPage.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}
bool isFirePressed = false;
bool isFavPressed = false;

class _HomeViewPageState extends State<HomeViewPage> {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final newsList = newsProvider.getNewsList;
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black12.withOpacity(0.7),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomAppBar(
                    isMain: true,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 10),
                    child: Text('Welcome to The Action !',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 3,
                          fontFamily: 'Barclays Premier League',
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    width: width * 0.6,
                    height: 1,
                    decoration: BoxDecoration(
                        color: const Color(0xff04F5FF),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                    child: Row(
                      children: [
                        Text('Top Leagues',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Barclays Premier League',
                              color: Colors.white,
                            )),
                        Spacer(),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: leaguesList.length,
                      itemBuilder: (builder, index) {
                        return  Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LeagueData(index: index,)));
                            },
                            child: LeagueBanner(
                              isMain:false,
                              image: leaguesList[index].image,
                              title: leaguesList[index].title,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                    child: Row(
                      children: [
                        const Text(' News',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                        const Spacer(),
                        InkWell(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=> const NewsViewPage()));
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
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (builder, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>  NewsContentView(index: index,)));
                            },
                            child: NewsItemWidget(imageUrl: newsList[index].imageUrl, title: newsList[index].title, index: index, isMain: false, isCenter: false,)),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.857,
                      crossAxisCount: 2,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
