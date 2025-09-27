//import some libraries and files
import 'package:flutter/material.dart';

//create stateless widget for making custom Button
class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key,
    required this.icon,
    this.size,
    this.color,
    this.fontWeight,
  });
  //create some variables
  final IconData icon;
  final double ? size;
  final Color ? color;
  final FontWeight ? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Icon(icon,size:size,color:color,fontWeight:fontWeight );
  }
}
