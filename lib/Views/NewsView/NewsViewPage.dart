import 'package:flutter/material.dart';
import 'package:live_soccer/Services/Providers/NewsProvider.dart';
import 'package:provider/provider.dart';
import '../Components/Widgets/CustomAppBar.dart';
import '../HomeView/widgets/NewsItemWidget.dart';

class NewsViewPage extends StatelessWidget {
  const NewsViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final newsList= newsProvider.getNewsList;
    return SafeArea(child: Scaffold(
      body: Container(
        color: Colors.black12.withOpacity(0.7),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(
                  isMain: false,
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height* 0.86,
                  child: ListView.builder(
                    shrinkWrap: true,
                   // physics: const NeverScrollableScrollPhysics(),
                      itemCount: newsList.length,
                      itemBuilder: (builder,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NewsItemWidget(imageUrl: newsList[index].imageUrl, title: newsList[index].title, index: index, isMain: true, isCenter: true,),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
