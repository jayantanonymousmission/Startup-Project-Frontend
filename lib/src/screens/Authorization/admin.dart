import 'package:flutter/material.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer_header.dart';
import 'package:startupproject/src/storage/custom_widgets/list_tile.dart';
import 'package:startupproject/src/utility/sharedPreferences/shared_preferences.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      //drawer
        drawer:Drawers(children:[
          CustomDrawerHeader(name:"Jayant", email:"jayant62644@gmail.com"),
          ListTiles(text:"DashBoard",icon:Icons.home),
          Divider(),
          ListTiles(text:"View all tickets",icon:Icons.message),
          Divider(),
          ListTiles(text:"Report Analysis",icon:Icons.analytics),
          Divider(),
          ListTiles(text:"Employees",icon:Icons.face),
          Divider(),
          ListTiles(text:"Workers",icon:Icons.face),
          Divider(),
          ListTiles(text:"Customers",icon:Icons.face),
          Divider(),
          ListTiles(text:"Settings",icon:Icons.settings),
          Divider(),
          ListTiles(text:"Logout",icon:Icons.logout),
          Divider(),
          ListTiles(text:"Back",icon:Icons.arrow_back_ios),
          Divider(),
        ]),
      body:SingleChildScrollView(
        child:Column(
          children: [
            Text("Admin"),
            TextButton(onPressed:()=>freeSharedPreferences(context), child:Text("Logout"))
          ],
        ),
      )
    );
  }
}
