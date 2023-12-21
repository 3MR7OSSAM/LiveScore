import 'package:flutter/material.dart';

import '../../Components/Widgets/NewsReactWidget.dart';
import '../../NewsView/NewsContentView.dart';
import 'CustomNetworkImage.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.index,
    required this.isMain,
    required this.isCenter,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final int index;
  final bool isMain;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>  NewsContentView(index: index,)));

      },
      child: Container(
        height: height * .32,
        width: isMain ? double.infinity : width * 0.4,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Hero(
                  tag: imageUrl, // Unique tag for the hero animation
                  child: CustomNetworkImage(
                    imageUrl: imageUrl,
                    isMain: isMain,
                    showTitle: true,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                height: height * .08,
                child: Text(
                  title.toLowerCase().trim(),
                  softWrap: true,
                  style: TextStyle(
                    fontSize: isMain ? 16 : 13,
                    color: Colors.white,
                  ),
                  textAlign:
                  isCenter ? TextAlign.center : TextAlign.left,
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
