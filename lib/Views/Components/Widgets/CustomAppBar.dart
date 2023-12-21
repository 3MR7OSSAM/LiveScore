import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.isMain,});
  final bool isMain;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black12.withOpacity(0.5)
      ),
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isMain ? Container():  InkWell(
                onTap:(){
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,size: 20,)),
            const Spacer(flex: 1,),
            RichText(
              text: const TextSpan(
                children: <TextSpan>[
                  TextSpan(text: 'Score', style: TextStyle(color:Colors.cyanAccent,fontSize: 18, fontFamily: 'Barclays Premier League')),
                  TextSpan(text: 'Zone', style: TextStyle(color: Colors.white,fontSize: 18, fontFamily: 'Barclays Premier League')),
                ],
              ),
            ),
         const Spacer(flex: 1,)
          ],
        ),
      ),
    );
  }
}
