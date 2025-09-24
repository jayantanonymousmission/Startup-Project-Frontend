
import 'package:flutter/material.dart';

//create helper class or function for scaffold
class SnackBarClass{
  static void snackBarFunction(BuildContext context,String text,Color color){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:Text(text,style:TextStyle(color:Colors.white)),
          backgroundColor:color
        )
    );
  }
}
