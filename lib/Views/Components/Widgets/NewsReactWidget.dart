import 'package:flutter/material.dart';

class NewsReactWidget extends StatefulWidget {
   NewsReactWidget({Key? key, required this.icon, required this.isPressed,}) : super(key: key);
  final IconData icon;
   bool isPressed;

  @override
  State<NewsReactWidget> createState() => _NewsReactWidgetState();
}

class _NewsReactWidgetState extends State<NewsReactWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color:!widget.isPressed ? Colors.white30:Colors.deepOrange.shade700,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
           // widget.isPressed ?   Text(widget.count,style: TextStyle(color: Colors.white),):SizedBox(),
            Icon(widget.icon,color: Colors.white,size: 18),
          ],
        ),
      ),
    );
  }
}
