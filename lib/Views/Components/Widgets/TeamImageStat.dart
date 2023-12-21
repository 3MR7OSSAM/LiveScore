import 'package:flutter/material.dart';

import '../../HomeView/widgets/CustomNetworkImage.dart';

class StatTeamImage extends StatelessWidget {
  const StatTeamImage({Key? key, required this.name, required this.imageUrl}) : super(key: key);
  final String name;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return Column(
      children: [
        SizedBox(
          width: height*0.07,
          height: height*0.07,
          child: CustomNetworkImage(
              imageUrl: imageUrl, isMain: false, showTitle: false,
          ),
        ),
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 90,
            child: Text(
              name,
              style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.clip,
            ),
          ),
        )
      ],
    );
  }
}
