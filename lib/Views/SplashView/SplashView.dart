import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Services/Providers/NewsProvider.dart';
import '../Components/Widgets/CustomAppBar.dart';
import '../HomeView/HomeView.dart';
import '../LostConnectionView/LostConnectionView.dart';

class SplashViewPage extends StatefulWidget {
  const SplashViewPage({Key? key}) : super(key: key);

  @override
  State<SplashViewPage> createState() => _SplashViewPageState();
}

class _SplashViewPageState extends State<SplashViewPage> {
Future<void> _checkInternet ()async{
  final result = await Connectivity().checkConnectivity();
  if(result == ConnectivityResult.none){
    if (context.mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LostConnectionView()));
  }
}
  @override
  void initState() {

    Future.delayed(const Duration(milliseconds: 8),()async{
      _checkInternet();
      final newsProvider = Provider.of<NewsProvider>(context,listen: false);
      final newsList = newsProvider.getNewsList;
      if (newsList.isEmpty ){
        await newsProvider.getNews();
      }
      if (context.mounted) Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const HomeViewPage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return  SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black12.withOpacity(0.7),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const CustomAppBar(isMain: true,),
                SizedBox(height: height*0.4,),
                const Center(child: Text('Loading...',style: TextStyle(color: Colors.white),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
