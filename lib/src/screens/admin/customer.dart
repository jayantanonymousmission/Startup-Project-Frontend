//import some libraries and files
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:startupproject/src/screens/Authorization/admin.dart';
import 'package:startupproject/src/screens/Authorization/super_admin.dart';
import 'package:startupproject/src/screens/admin/employee.dart';
import 'package:startupproject/src/screens/admin/report_analysis.dart';
import 'package:startupproject/src/screens/admin/worker.dart';
import 'package:startupproject/src/screens/super_admin/admin.dart';
import 'package:startupproject/src/screens/super_admin/report_analysis.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/storage/custom_widgets/custom_card.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer_header.dart';
import 'package:startupproject/src/storage/custom_widgets/icon.dart';
import 'package:startupproject/src/storage/custom_widgets/list_tile.dart';
import 'package:startupproject/src/storage/custom_widgets/text_field.dart';
import 'package:startupproject/src/utility/sharedPreferences/shared_preferences.dart';

class CustomerInAdmin extends StatefulWidget {
  const CustomerInAdmin({super.key});
  @override
  State<CustomerInAdmin> createState() => _CustomerInAdminState();
}

class _CustomerInAdminState extends State<CustomerInAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlueAccent),
      drawer: Drawers(
        children: [
          CustomDrawerHeader(name: "Jayant", email: "jayant62644@gmail.com"),
          ListTiles(text: "DashBoard", icon: Icons.home,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>AdminScreen()));},),
          Divider(),
          ListTiles(text: "Report Analysis", icon: Icons.analytics,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>ReportAnalysisOfAdmin()));}),
          Divider(),
          ListTiles(text: "Employees", icon: Icons.face,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>EmployeeInAdmin()));},),
          Divider(),
          ListTiles(text: "Workers", icon: Icons.face,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>WorkerInAdmin()));},),
          Divider(),
          ListTiles(text: "Customers", icon: Icons.face,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>CustomerInAdmin()));},),
          Divider(),
          ListTiles(text: "Logout", icon: Icons.logout,callback:(){freeSharedPreferences(context);},),
          Divider(),
          ListTiles(text: "Back", icon: Icons.arrow_forward_ios,callback:(){Navigator.pop(context);},),
          Divider(),
        ],
      ),
      //for web
      body: kIsWeb
          ? SingleChildScrollView(
        child: Column(
          children: [
            Text("Admin Web"),
            //Card
            Card(color: Colors.red, child:LabelText(text:"Card")),
          ],
        ),
      )
          :
      //for app or desktop
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: LabelText(text: "Customer Data Panel"),
            ),
            Wrap(
              children: [
                CustomCard(
                  width:200,
                  height:150,
                  color: AppColor.blueAccent,
                  children: [
                    Center(
                        child:Padding(padding:EdgeInsets.all(10),child:
                        CustomIcon(icon:Icons.account_box_outlined,size:30,color:AppColor.white))
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: LabelText(
                        text: "Total Customers:\n5000",
                        color: AppColor.white,
                        fontWeight:FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                CustomCard(
                  width:200,
                  height:150,
                  color: AppColor.pinkAccent,
                  children: [
                    Center(
                        child:Padding(padding:EdgeInsets.all(10),child:
                        CustomIcon(icon:Icons.account_box_outlined,size:30,color:AppColor.white))
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: LabelText(
                        text: "Solved Tickets:\n5000",
                        color: AppColor.white,
                        fontWeight:FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                CustomCard(
                  width:200,
                  height:150,
                  color: AppColor.green,
                  children: [
                    Center(
                        child:Padding(padding:EdgeInsets.all(10),child:
                        CustomIcon(icon:Icons.account_box_outlined,size:30,color:AppColor.white))
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: LabelText(
                        text: "Pending Tickets:\n5000",
                        color: AppColor.white,
                        fontWeight:FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            //Worker Registration Data
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: LabelText(text: "Customer Data"),
            ),

            //Worker tickets
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: EdgeInsets.all(20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width - 50,
                  ),
                  child: DataTable(
                    border: TableBorder.all(width: 1),
                    columns: [
                      DataColumn(label: LabelText(text: "Id")),
                      DataColumn(label: LabelText(text: "Name")),
                      DataColumn(label: LabelText(text: "Email")),
                      DataColumn(label: LabelText(text: "Address")),
                      DataColumn(label: LabelText(text: "role")),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(
                            LabelText(
                              text: "123e134",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Jayant",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "jayant62644@gmail.com",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Broken Product",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Pending",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            LabelText(
                              text: "123e134",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Jayant",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "jayant62644@gmail.com",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Broken Product",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Pending",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            LabelText(
                              text: "123e134",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Jayant",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "jayant62644@gmail.com",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Broken Product",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Pending",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            LabelText(
                              text: "123e134",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Jayant",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "jayant62644@gmail.com",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Broken Product",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Pending",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            LabelText(
                              text: "123e134",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Jayant",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "jayant62644@gmail.com",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Broken Product",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Pending",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            LabelText(
                              text: "123e134",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Jayant",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "jayant62644@gmail.com",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Broken Product",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Pending",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            LabelText(
                              text: "123e134",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Jayant",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "jayant62644@gmail.com",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Broken Product",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Pendingl",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),


            //admin tickets heading
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: LabelText(text: "Customer Tickets"),
            ),

            //admin tickets
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: EdgeInsets.all(20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width - 50,
                  ),
                  child: DataTable(
                    border: TableBorder.all(width: 1),
                    columns: [
                      DataColumn(label: LabelText(text: "Id")),
                      DataColumn(label: LabelText(text: "Name")),
                      DataColumn(label: LabelText(text: "Email")),
                      DataColumn(label: LabelText(text: "title")),
                      DataColumn(label: LabelText(text: "status")),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(
                            LabelText(
                              text: "123e134",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Jayant",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "jayant62644@gmail.com",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Broken Product",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Pending",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            LabelText(
                              text: "123e134",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Jayant",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "jayant62644@gmail.com",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Broken Product",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Pending",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            LabelText(
                              text: "123e134",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Jayant",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "jayant62644@gmail.com",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Broken Product",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Pending",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            LabelText(
                              text: "123e134",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Jayant",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "jayant62644@gmail.com",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Broken Product",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Pending",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            LabelText(
                              text: "123e134",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Jayant",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "jayant62644@gmail.com",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Broken Product",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Pending",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            LabelText(
                              text: "123e134",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Jayant",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "jayant62644@gmail.com",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Broken Product",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Pending",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            LabelText(
                              text: "123e134",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Jayant",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "jayant62644@gmail.com",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Broken Product",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: "Pendingl",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
