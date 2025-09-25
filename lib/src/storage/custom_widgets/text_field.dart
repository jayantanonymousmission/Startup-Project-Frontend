//import some libraries and file
import 'package:flutter/material.dart';

//create stateless class
class LabelText extends StatelessWidget {
  const LabelText({super.key,required this.text,this.fontWeight=FontWeight.bold,this.color=Colors.black,this.fontSize=20,this.textDecoration});
  //crate some variables
  final String text;
  final FontWeight ? fontWeight;
  final Color ? color;
  final double ? fontSize;
  final TextDecoration ? textDecoration;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
        fontSize:fontSize,
        fontWeight:fontWeight,
        color:color ,
        decoration:textDecoration
        )
    );
  }
}
