//import some libraries and files
import 'package:flutter/material.dart';
import 'package:startupproject/src/storage/custom_widgets/text_field.dart';

//create stateless widget for making custom Button
class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key,
  required this.callback,
  required this.text,
  required this.color,
  required this.size,
  required this.textDecoration,
  required this.backgroundColor,
  required this.borderRadius,
  });
  //create some variables
  final VoidCallback callback;
  final String text;
  final Color color;
  final double size;
  final TextDecoration textDecoration;
  final Color ? backgroundColor;
  final BorderRadius ? borderRadius;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed:callback,
        style:TextButton.styleFrom(
          backgroundColor:backgroundColor,
          shape:RoundedRectangleBorder(
            borderRadius:borderRadius ?? BorderRadius.circular(20),
          )
        ),
        child:LabelText(text:text,color:color,fontSize:size,textDecoration:textDecoration)
    );
  }
}
