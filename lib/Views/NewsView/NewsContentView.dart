import 'package:flutter/material.dart';
import 'package:live_soccer/Services/Providers/NewsProvider.dart';
import 'package:live_soccer/Views/Components/Widgets/shimmerLoding.dart';
import 'package:provider/provider.dart';

import '../Components/Widgets/CustomAppBar.dart';
import '../HomeView/widgets/NewsItemWidget.dart';

class NewsContentView extends StatefulWidget {
  const NewsContentView({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<NewsContentView> createState() => _NewsContentViewState();
}

class _NewsContentViewState extends State<NewsContentView> {
  String content = '';
  @override
  void initState() {
    final newsProvider = Provider.of<NewsProvider>(context,listen: false);
    newsProvider.emptyContent();
     content = '';

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    final newsProvider = Provider.of<NewsProvider>(context);
    final newsItem = newsProvider.getNewsList[widget.index];
    newsProvider.getNewsContent(itemUrl: newsItem.contentUrl);
     content = newsProvider.getContent;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          color: Colors.black12.withOpacity(0.7),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomAppBar(
                    isMain: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          NewsItemWidget(imageUrl: newsItem.imageUrl, title: newsItem.title, index: 2, isMain: true, isCenter: true,),
                          const SizedBox(height: 2,),
                          content == '' ? ShimmerLoading(child: Container(
                            height: height*0.55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)
                            ),
                          ),):Container(

                            decoration: BoxDecoration(
                                color: Colors.black12.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(content,style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white70,
                              ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          )
                        ],
                      ),
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
