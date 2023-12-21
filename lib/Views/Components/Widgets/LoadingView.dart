import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingViewWidget extends StatelessWidget {
  const LoadingViewWidget({Key? key, this.isMain, required this.showTitle}) : super(key: key);
  final bool? isMain ;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {

    return Container(
        height: double.infinity,
        width: double.infinity,
        color: isMain != null ?  Colors.black12 :Colors.black12.withOpacity(0.7),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width:  isMain != null ? 100 :200,
                //height: 200,
                child: Lottie.asset('assests/animation_lofn022o.json')),
            const SizedBox(height: 5,),
            showTitle ? Text(
              'Loading..',
              style: TextStyle(color: Colors.white, fontSize: isMain != null ? 10  :14),
            ):const SizedBox(),
          ],
        ));
  }
}
