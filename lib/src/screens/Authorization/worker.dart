import 'package:flutter/material.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer_header.dart';
import 'package:startupproject/src/storage/custom_widgets/list_tile.dart';

import '../../utility/sharedPreferences/shared_preferences.dart';

class WorkerScreen extends StatefulWidget {
  const WorkerScreen({super.key});

  @override
  State<WorkerScreen> createState() => _WorkerScreenState();
}

class _WorkerScreenState extends State<WorkerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(),
        drawer:Drawers(children:[
          CustomDrawerHeader(name:"Jayant", email:"jayant62644@gmail.com"),
          ListTiles(text:"DashBoard",icon:Icons.home),
          Divider(),
          ListTiles(text:"View all tickets",icon:Icons.message_outlined),
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
              Text("Worker"),
              TextButton(onPressed:()=>freeSharedPreferences(context), child:Text("Logout"))
            ],
          ),
        )
    );
  }
}
