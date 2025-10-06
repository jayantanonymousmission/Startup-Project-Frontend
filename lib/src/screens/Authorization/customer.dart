//import some libraries and files
import 'package:flutter/material.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer_header.dart';
import 'package:startupproject/src/storage/custom_widgets/list_tile.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(

        ),
        //create drawer
        drawer:Drawers(children:[
          CustomDrawerHeader(name:"Jayant", email:"jayant62644@gmail.com"),
          ListTiles(text:"DashBoard",icon:Icons.home),
          Divider(),
          ListTiles(text:"View all tickets",icon:Icons.message),
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
              Text("Customer"),
              //TextButton(onPressed:()=>freeSharedPreferences(context), child:Text("Logout"))
            ],
          ),
        )
    );
  }
}
