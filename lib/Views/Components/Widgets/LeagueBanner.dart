import 'package:flutter/material.dart';
class LeagueBanner extends StatelessWidget {
  const LeagueBanner({
    super.key,
     this.progress, required this.image, required this.title, required this.isMain
  });

  final double? progress;
  final String image;
  final String title;
 final bool isMain;
  @override
  Widget build(BuildContext context) {

    return Container(
      height:isMain ? 150:150,
      width: isMain ? double.infinity:230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black12.withOpacity(0.4)),
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: isMain ? MainAxisAlignment.start:MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: title,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white30.withOpacity(0.4),
                          borderRadius:
                          BorderRadius.circular(100)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15,
                            child: Image.asset(
                              image,
                              width: 25,
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              isMain ? SizedBox(
                 width: 170,
                 child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(16),
                    backgroundColor: Colors.white,
                    color: const Color(0xff04F5FF),
                    value:progress,
                  ),
              ),
               ):const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
