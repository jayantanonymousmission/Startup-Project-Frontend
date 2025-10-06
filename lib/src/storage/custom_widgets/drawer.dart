//import some libraries and files
import 'package:flutter/material.dart';
import 'package:startupproject/src/storage/constant/constants.dart';

//create custom class for making custom drawer
class Drawers extends StatelessWidget {
  const Drawers({super.key,required this.children});
  //create some variables
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor:AppColor.blueGrey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: children
          ),
        ),
      );
  }
}
