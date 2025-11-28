//import some libraries and files
import 'package:flutter/material.dart';
import 'package:startupproject/src/models/Registration/registration.dart';
import 'package:startupproject/src/screens/employee/customer.dart';
import 'package:startupproject/src/screens/employee/report_analysis.dart';
import 'package:startupproject/src/screens/employee/view_all_tickets.dart';
import 'package:startupproject/src/screens/employee/worker.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/storage/custom_widgets/custom_card.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer_header.dart';
import 'package:startupproject/src/storage/custom_widgets/icon.dart';
import 'package:startupproject/src/storage/custom_widgets/list_tile.dart';
import 'package:startupproject/src/storage/custom_widgets/text_field.dart';
import 'package:startupproject/src/utility/controllerFunctions/registrationData/registrationData.dart';
import 'package:startupproject/src/utility/controllerFunctions/totalRole/customers.dart';
import 'package:startupproject/src/utility/controllerFunctions/totalRole/workers.dart';
import '../../utility/sharedPreferences/shared_preferences.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});
  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  //create some variables
  int totalCustomers=0;
  int totalWorkers=0;
  List<RegistrationModel> ? registrationData = [];

  @override
  void initState() {
    super.initState();
    //Total Customers
    totalCustomerRoleControllerFunction(
      context: context,
      onValueFetched: (value) {
        if(mounted) {
          setState(() {
            totalCustomers = value;
          });
        }
      },
    );
    //Total Workers
    totalWorkersRoleControllerFunction(
      context: context,
      onValueFetched: (value) {
        if(mounted) {
          setState(() {
            totalWorkers = value;
          });
        }
      },
    );
    //User Data
    registrationUserDataControllerFunction(
        context: context,
        onValueFetched:(List<RegistrationModel> data){
          if (mounted) {
            setState(() {
              registrationData = data;
            });
          }
        }
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlueAccent),
      drawer: Drawers(
        children: [
          CustomDrawerHeader(name: "Jayant", email: "jayant62644@gmail.com"),
          ListTiles(text: "DashBoard", icon: Icons.home,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>EmployeeScreen()));},),
          Divider(),
          ListTiles(text: "View All Tickets", icon: Icons.home,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>ViewAllTicketsOfEmployee()));},),
          Divider(),
          ListTiles(text: "Report Analysis", icon: Icons.analytics,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>ReportAnalysisOfEmployee()));}),
          Divider(),
          ListTiles(text: "Workers", icon: Icons.face,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>WorkerInEmployee()));}),
          Divider(),
          ListTiles(text: "Customers", icon: Icons.face,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>CustomerInEmployee()));}),
          Divider(),
          ListTiles(text: "Logout", icon: Icons.logout,callback:(){freeSharedPreferences(context);}),
          Divider(),
          ListTiles(text: "Back", icon: Icons.arrow_forward_ios,),
          Divider(),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: LabelText(text: "Welcome to Employee DashBoard"),
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
                        text: "Total Customers:\n$totalCustomers",color: AppColor.white,fontWeight:FontWeight.normal),
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
                        text: "Total Workers:\n$totalWorkers",color: AppColor.white,fontWeight:FontWeight.normal,
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: LabelText(text: "Registration Data"),
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
                    child:DataTable(
                      border: TableBorder.all(width: 1),
                      columns: const [
                        DataColumn(label: LabelText(text:'Id')),
                        DataColumn(label: LabelText(text:'Name')),
                        DataColumn(label: LabelText(text:'Email')),
                        DataColumn(label: LabelText(text:'Gender')),
                        DataColumn(label: LabelText(text:'Address')),
                        DataColumn(label: LabelText(text:'Role')),
                      ],
                      rows: registrationData!.map((registration){
                        return DataRow(
                          cells: [
                            DataCell(LabelText(
                              text:registration.id ?? "",
                              fontWeight: FontWeight.normal,
                            )),
                            DataCell(LabelText(
                              text:registration.name ?? '',
                              fontWeight: FontWeight.normal,
                            )),
                            DataCell(LabelText(
                              text:registration.email ?? '',
                              fontWeight: FontWeight.normal,
                            )),
                            DataCell(LabelText(
                              text:registration.gender ?? '',
                              fontWeight: FontWeight.normal,
                            )),
                            DataCell(LabelText(
                              text:registration.address ?? '',
                              fontWeight: FontWeight.normal,
                            )),
                            DataCell(LabelText(
                              text:registration.role ?? '',
                              fontWeight: FontWeight.normal,
                            )),
                          ],
                        );
                      }).toList(),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
