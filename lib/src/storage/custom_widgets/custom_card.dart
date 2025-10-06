//import some libraries and files
import 'package:flutter/material.dart';

//create custom card class
class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.children,this.color,this.height=100,this.width=200});
  //create variables
  final List<Widget> children;
  final Color ? color;
  final double ? height;
  final double ? width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height:height,width:width,
        child:Card(
          color:color,
          child:Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:children
          ),
        ),
      ),
    );
  }
}
