//import some libraries and files
import 'package:flutter/material.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});
  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor:Colors.lightBlueAccent,
        ),
        //create drawer
        drawer:Drawer(
          backgroundColor:Colors.lightBlue,
          child:Padding(
            padding: const EdgeInsets.all(18),
            child: ListView(
              children: [
                DrawerHeader(
                  child:SingleChildScrollView(
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
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text("Name:Jayant",style:TextStyle(color:Colors.white)),
                        ),
                        Text("Email:jayant62644@gmail.com",style:TextStyle(color:Colors.white),),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title:Text("Dashboard",style:TextStyle(color:Colors.white),),
                  trailing:Icon(Icons.home,color:Colors.white,),
                  onTap:(){},
                ),
                Divider(),
                ListTile(
                  title:Text("View all complaints",style:TextStyle(color:Colors.white),),
                  trailing:Icon(Icons.message_outlined,color:Colors.white,),
                  onTap:(){},
                ),
                Divider(),
                ListTile(
                  title:Text("Report Analysis",style:TextStyle(color:Colors.white),),
                  trailing:Icon(Icons.analytics,color:Colors.white,),
                  onTap:(){},
                ),
                Divider(),
                ListTile(
                  title:Text("Worker Data",style:TextStyle(color:Colors.white),),
                  trailing:Icon(Icons.face,color:Colors.white,),
                  onTap:(){},
                ),
                Divider(),
                ListTile(
                  title:Text("Customer Data",style:TextStyle(color:Colors.white),),
                  trailing:Icon(Icons.face,color:Colors.white,),
                  onTap:(){},
                ),
                Divider(),
                ListTile(
                  title:Text("settings",style:TextStyle(color:Colors.white),),
                  trailing:Icon(Icons.settings,color:Colors.white,),
                  onTap:(){},
                ),
                Divider(),
                ListTile(
                  title:Text("Logout",style:TextStyle(color:Colors.white),),
                  trailing:Icon(Icons.logout,color:Colors.white,),
                  onTap:(){},
                ),
                Divider(),
                ListTile(
                  title:Text("Back",style:TextStyle(color:Colors.white),),
                  trailing:Icon(Icons.move_up,color:Colors.white,),
                  onTap:(){},
                ),
              ],
            ),
          ),
        ),
        body:SingleChildScrollView(
          child:Column(
            children: [
              Text("Employee"),
              //TextButton(onPressed:()=>freeSharedPreferences(context), child:Text("Logout"))
            ],
          ),
        )
    );
  }
}
