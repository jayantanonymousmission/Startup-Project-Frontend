//import some libraries and files
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:startupproject/src/screens/super_admin/report_analysis.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/storage/custom_widgets/custom_card.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer_header.dart';
import 'package:startupproject/src/storage/custom_widgets/icon.dart';
import 'package:startupproject/src/storage/custom_widgets/list_tile.dart';
import 'package:startupproject/src/storage/custom_widgets/text_field.dart';

class SuperAdminScreen extends StatefulWidget {
  const SuperAdminScreen({super.key});
  @override
  State<SuperAdminScreen> createState() => _SuperAdminScreenState();
}

class _SuperAdminScreenState extends State<SuperAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlueAccent),
      drawer: Drawers(
        children: [
          CustomDrawerHeader(name: "Jayant", email: "jayant62644@gmail.com"),
          ListTiles(text: "DashBoard", icon: Icons.home,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>SuperAdminScreen()));},),
          Divider(),
          ListTiles(text: "Report Analysis", icon: Icons.analytics,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>ReportAnalysisOfSuperAdmin()));}),
          Divider(),
          ListTiles(text: "Admin", icon: Icons.face),
          Divider(),
          ListTiles(text: "Employees", icon: Icons.face),
          Divider(),
          ListTiles(text: "Workers", icon: Icons.face),
          Divider(),
          ListTiles(text: "Customers", icon: Icons.face),
          Divider(),
          ListTiles(text: "Settings", icon: Icons.settings),
          Divider(),
          ListTiles(text: "Logout", icon: Icons.logout),
          Divider(),
          ListTiles(text: "Back", icon: Icons.arrow_back_ios),
          Divider(),
        ],
      ),
      //for web
      body: kIsWeb
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Text("Super Admin Web"),
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
                    child: LabelText(text: "Welcome to Super Admin DashBoard"),
                  ),
                  Wrap(
                    children: [
                      CustomCard(
                        width:200,
                        height:150,
                        color: AppColor.lightBlueAccent,
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
                              text: "Total Workers:\n5000",
                              color: AppColor.white,
                              fontWeight:FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      CustomCard(
                        width:200,
                        height:150,
                        color: AppColor.purpleAccent,
                        children: [
                          Center(
                              child:Padding(padding:EdgeInsets.all(10),child:
                          CustomIcon(icon:Icons.account_box_outlined,size:30,color:AppColor.white))
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: LabelText(
                              text: "Total Employees:\n5000",
                              color: AppColor.white,
                              fontWeight:FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      CustomCard(
                        width:200,
                        height:150,
                        color: AppColor.orangeAccent,
                        children: [
                          Center(
                              child:Padding(padding:EdgeInsets.all(10),child:
    CustomIcon(icon:Icons.account_box_outlined,size:30,color:AppColor.white))
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: LabelText(
                              text: "Total Admin:\n5000",
                              color: AppColor.white,
                              fontWeight:FontWeight.normal,
                            ),
                          ),
                        ],
                      ),

                      // total salary
                      CustomCard(
                        width:200,
                        height:150,
                        color: AppColor.indigo,
                        children: [
                          Center(
                              child:Padding(
                                padding: const EdgeInsets.all(10),
                                child: CustomIcon(icon:Icons.account_balance_wallet_rounded,size:30,color:AppColor.white),
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: LabelText(
                              text: "Workers Salary:\n5000",
                              color: AppColor.white,
                              fontWeight:FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      CustomCard(
                        width:200,
                        height:150,
                        color: AppColor.cyan,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                                child:CustomIcon(icon:Icons.account_balance_wallet_rounded,color:AppColor.white,size:30,)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: LabelText(
                              text: "Employee Salary:\n5000",
                              color: AppColor.white,
                              fontWeight:FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      CustomCard(
                        width:200,
                        height:150,
                        color: AppColor.grey,
                        children: [
                          Center(
                              child:Padding(
                                padding: const EdgeInsets.all(10),
                                child: CustomIcon(icon:Icons.account_balance_wallet_rounded,color:AppColor.white,size:30,),
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: LabelText(
                              text: "Admin Salary:\n5000",
                              color: AppColor.white,
                              fontWeight:FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                    child: LabelText(text: "Recently Tickets"),
                  ),

                  //viw recent tickets
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
