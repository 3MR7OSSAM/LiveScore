import 'package:flutter/material.dart';
import 'dart:async';

class LivePoint extends StatefulWidget {
  @override
  _LivePointState createState() => _LivePointState();
}
class _LivePointState extends State<LivePoint> {
  bool isOn = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Create a timer that toggles the point every second
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        isOn = !isOn;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isOn ? Colors.transparent : Colors.red, // Change color based on state
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(3.0),
          child: Text('Live',style: TextStyle(color: Colors.white,fontSize: 14),),
        )
      ],
    );
  }
}
