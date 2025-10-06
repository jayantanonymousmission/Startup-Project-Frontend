//import some libraries and files
import 'package:flutter/material.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/storage/custom_widgets/text_field.dart';

//create custom drawer header
class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key,required this.name,required this.email});
   //create some variables
   final String name;
   final String email;
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 40, // Set your desired size
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    "https://img.freepik.com/premium-photo/cartoon-action-figures-3d_853677-35098.jpg?w=2000",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text("Name:$name",style:TextStyle(color:AppColor.white)),
            Text("Email:$email",style:TextStyle(color:AppColor.white)),
          ],
        ),
      ),
    );
  }
}
