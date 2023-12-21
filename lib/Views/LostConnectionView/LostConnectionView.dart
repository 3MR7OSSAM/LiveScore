import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/Widgets/CustomAppBar.dart';
import '../SplashView/SplashView.dart';

class LostConnectionView extends StatelessWidget {
  const LostConnectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return  SafeArea(
      child: RefreshIndicator(
        onRefresh: () async{
          final result = await Connectivity().checkConnectivity();
          if(result != ConnectivityResult.none){
            if (context.mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SplashViewPage()));
          }
        },
        child: Scaffold(
          body: ListView(children: [
            Container(
              height: height,
              color: Colors.black12.withOpacity(0.7),
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomAppBar(isMain: true,),
                    SizedBox(height: height*0.4,),
                    const Center(
                      child: Center(child: Text('Lost Internet Connection , Swipe down to check again !',style: TextStyle(color: Colors.white,decoration: TextDecoration.underline),textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
              ),
            ),
          ],
          ),
        ),
      ),
    );
  }
}
