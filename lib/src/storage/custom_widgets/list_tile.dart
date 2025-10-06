//import some libraries and files
import 'package:flutter/material.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/storage/custom_widgets/icon.dart';

//create custom class for custom list tile
class ListTiles extends StatelessWidget {
  const ListTiles({super.key,required this.icon,this.callback,required this.text});
  //create some variables
  final String text;
  final VoidCallback ? callback;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:Text(text,style:TextStyle(color:AppColor.white)),
      trailing: CustomIcon(icon:icon,color:AppColor.white,),
      onTap:callback,
    );
  }
}