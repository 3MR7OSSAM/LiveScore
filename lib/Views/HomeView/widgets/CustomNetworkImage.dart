import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Components/Widgets/LoadingView.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({Key? key, required this.imageUrl, required this.isMain, required this.showTitle}) : super(key: key);
  final String imageUrl;
  final bool isMain;
  final bool showTitle;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return  CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => SizedBox(
          width: double.infinity,  // Set the width and height as per your requirement
          height:isMain ? height * 0.2 :height * 0.1 ,
          child:  LoadingViewWidget(isMain: true,showTitle: showTitle,)),
      imageBuilder: (context, image) => Container(
        width: double.infinity,  // Set the width and height as per your requirement
        height:isMain ? height * 0.2 :height * 0.1 ,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.fill,  // You can change the fit as needed
          ),
        ),
      ),
    );
  }
}
