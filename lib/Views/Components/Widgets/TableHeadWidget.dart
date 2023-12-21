import 'package:flutter/material.dart';
class TableHead extends StatelessWidget {
  const TableHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 35,
        width: MediaQuery.sizeOf(context).width *.98,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color:  Colors.black12.withOpacity(0.6),
        ),
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text('Team',style: TextStyle(color: Colors.white),),
              const Spacer(),
              SizedBox(width: MediaQuery.sizeOf(context).width *.37,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 1,),
                  Text('P',style: TextStyle(color: Colors.white),),
                  Text('M',style: TextStyle(color: Colors.white),),
                  Text('W',style: TextStyle(color: Colors.white),),
                  Text('D',style: TextStyle(color: Colors.white),),
                  Text('L',style: TextStyle(color: Colors.white),),
                  Text('GF/GA',style: TextStyle(color: Colors.white),),
                 // SizedBox(width: 1,)
                ],
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
