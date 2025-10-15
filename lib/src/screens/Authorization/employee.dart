//import some libraries and files
import 'package:flutter/material.dart';
import 'package:startupproject/src/models/Tickting/tickting.dart';
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
import 'package:startupproject/src/utility/controllerFunctions/recentlyTIckets/recently_tickets.dart';
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
  int TotalCustomers=0;
  int TotalWorkers=0;
  List<TicktingModel> ? ticketData = [];

  @override
  void initState() {
    super.initState();
    //Total Customers
    totalCustomerRoleControllerFunction(
      context: context,
      onValueFetched: (value) {
        setState(() {
          TotalCustomers = value;
        });
      },
    );
    //Total Workers
    totalWorkersRoleControllerFunction(
      context: context,
      onValueFetched: (value) {
        setState(() {
          TotalWorkers = value;
        });
      },
    );
    //Recently Tickets
    recentlyTicketsControllerFunction(
      context: context,
      onValueFetched: (List<TicktingModel> data) {
        setState(() {
          ticketData = data;
          print(ticketData);
        });
      },
    );
  }
  @override
  void dispose() {
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
                        text: "Total Customers:\n$TotalCustomers",color: AppColor.white,fontWeight:FontWeight.normal),
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
                        text: "Total Workers:\n$TotalWorkers",color: AppColor.white,fontWeight:FontWeight.normal,
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
                    child:DataTable(
                      columns: const [
                        DataColumn(label: Text('Ticket ID')),
                        DataColumn(label: Text('Product Name')),
                        DataColumn(label: Text('Mobile Number')),
                        DataColumn(label: Text('Complaint Title')),
                        DataColumn(label: Text('Status')),
                      ],
                      rows: ticketData!.map((ticket) {
                        return DataRow(
                          cells: [
                            DataCell(LabelText(
                              text: ticket.ticket_id ?? '',
                              fontWeight: FontWeight.normal,
                            )),
                            DataCell(LabelText(
                              text: ticket.product_name ?? '',
                              fontWeight: FontWeight.normal,
                            )),
                            DataCell(LabelText(
                              text: ticket.mobile_number?.toString() ?? '',
                              fontWeight: FontWeight.normal,
                            )),
                            DataCell(LabelText(
                              text: ticket.complaint_title ?? '',
                              fontWeight: FontWeight.normal,
                            )),
                            DataCell(LabelText(
                              text: ticket.status ?? '',
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
