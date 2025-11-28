//import some libraries and files
import 'package:flutter/material.dart';
import 'package:startupproject/src/models/Tickting/tickting.dart';
import 'package:startupproject/src/screens/Authorization/employee.dart';
import 'package:startupproject/src/screens/employee/customer.dart';
import 'package:startupproject/src/screens/employee/report_analysis.dart';
import 'package:startupproject/src/screens/employee/view_all_tickets.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/storage/custom_widgets/custom_card.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer_header.dart';
import 'package:startupproject/src/storage/custom_widgets/icon.dart';
import 'package:startupproject/src/storage/custom_widgets/list_tile.dart';
import 'package:startupproject/src/storage/custom_widgets/text_button.dart';
import 'package:startupproject/src/storage/custom_widgets/text_field.dart';
import 'package:startupproject/src/storage/custom_widgets/text_form_field.dart';
import 'package:startupproject/src/utility/controllerFunctions/totalRole/workers.dart';
import 'package:startupproject/src/utility/controllerFunctions/totalStatus/totalStatus.dart';
import 'package:startupproject/src/utility/sharedPreferences/shared_preferences.dart';
import '../../api/UpdateRole/updateRole.dart';
import '../../utility/controllerFunctions/recentlyTIckets/recentlyTIcketsOfWorker.dart';

class WorkerInEmployee extends StatefulWidget {
  const WorkerInEmployee({super.key});
  @override
  State<WorkerInEmployee> createState() => _WorkerInEmployeeState();
}

class _WorkerInEmployeeState extends State<WorkerInEmployee> {
  //create some variable
  int totalWorkers=0;
  List<Map<String,dynamic>> totalStatus = [];
  final _formKey = GlobalKey<FormState>();
  String selectedRole="customer";
  TextEditingController idController = TextEditingController();
  List<TicktingModel>? ticketData = [];

  @override
  void initState() {
    //total worker
    totalWorkersRoleControllerFunction(
        context: context,
        onValueFetched:(value) {
          if (mounted) {
            setState(() {
              totalWorkers = value;
            });
          }
        }
    );
    //total status
    totalStausControllerFunction(
        context: context,
        onValueFetched: (value) {
          if (mounted) {
            setState(() {
              totalStatus = value;
            });
          }
        }
    );
    //Recently Tickets
    recentlyTicketsOfWorkerControllerFunction(
      context: context,
      onValueFetched: (List<TicktingModel> data) {
        if (mounted) {
          setState(() {
            ticketData = data;
          });
        }
      }
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  //controller functions
  //Update Role
  void updateRole() async {
    final role = await UpdateRole.updateRoleFunction(
      idController.text.trim(),
      selectedRole
    );
    //checking conditions
    final messenger = ScaffoldMessenger.of(
      Navigator.of(context, rootNavigator: true).context,
    );

    if (role != null) {
      messenger.showSnackBar(
        SnackBar(
          content: Text("Role Successfully Updated"),
          backgroundColor: AppColor.blueAccent,
        ),
      );
      Navigator.pop(context); // Close the dialog after success
    } else {
      messenger.showSnackBar(
        SnackBar(
          content: Text("Role Not Updated"),
          backgroundColor: AppColor.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedStatusText = totalStatus.isNotEmpty
        ? totalStatus.map((e) => "${e['status']}: ${e['count']}").join("\n")
        : "No Data";
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
          ListTiles(text: "Workers", icon: Icons.face,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>WorkerInEmployee()));},),
          Divider(),
          ListTiles(text: "Customers", icon: Icons.face,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>CustomerInEmployee()));},),
          Divider(),
          ListTiles(text: "Logout", icon: Icons.logout,callback:(){freeSharedPreferences(context);},),
          Divider(),
          ListTiles(text: "Back", icon: Icons.arrow_forward_ios),
          Divider(),
        ],
      ),
      //for web
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: LabelText(text: "Worker Data Panel"),
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
                        text: "Total Workers:\n$totalWorkers",
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
                  color: AppColor.pinkAccent,
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
                  color: AppColor.pinkAccent,
                  children: [
                    Center(
                        child:Padding(padding:EdgeInsets.all(10),child:
                        CustomIcon(icon:Icons.account_box_outlined,size:30,color:AppColor.white))
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: LabelText(
                        text: "Solved Tickets:\n$formattedStatusText",
                        color: AppColor.white,
                        fontWeight:FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            //work assign to admin through super admin
            Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: CustomTextButton(
                      callback: () {},
                      text: "Holiday List",
                      color: AppColor.white,
                      size: 17,
                      textDecoration: TextDecoration.none,
                      backgroundColor: AppColor.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  //SizedBox(width:20),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: CustomTextButton(
                      callback: () {},
                      text: "Meeting",
                      color: AppColor.white,
                      size: 17,
                      textDecoration: TextDecoration.none,
                      backgroundColor: AppColor.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  //SizedBox(width:20),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: CustomTextButton(
                      callback: () {},
                      text: "Assign Work",
                      color: AppColor.white,
                      size: 17,
                      textDecoration: TextDecoration.none,
                      backgroundColor: AppColor.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: CustomTextButton(
                      callback: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: LabelText(text: "Update Role"),
                                  ),
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        CustomTextField(
                                          text: "Enter Mobile Number",
                                          controller:idController,
                                          validation: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: DropdownButtonFormField<String>(
                                            value: selectedRole,
                                            items: ['admin',"superAdmin",'customer','employee','worker']
                                                .map(
                                                  (level) => DropdownMenuItem(
                                                value: level,
                                                child: Text(level),
                                              ),
                                            )
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                selectedRole = value!;
                                              });
                                            },
                                            decoration: InputDecoration(
                                              labelText: "Complaint Level",
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.blue,
                                                  width: 2,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.blue,
                                                  width: 2,
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.red,
                                                  width: 2,
                                                ),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.red,
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                            validator: (value) => value == null
                                                ? 'Please select a Complaint Level'
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: CustomTextButton(
                                            callback: () {
                                              Navigator.pop(context);
                                            },
                                            text: "Quit",
                                            color: AppColor.green,
                                            size: 20,
                                            textDecoration: TextDecoration.none,
                                            backgroundColor:
                                            AppColor.transparent,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: CustomTextButton(
                                            callback: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                updateRole();
                                              }
                                            },
                                            text: "Update",
                                            color: AppColor.blueAccent,
                                            size: 20,
                                            textDecoration: TextDecoration.none,
                                            backgroundColor:
                                            AppColor.transparent,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      text: "Update Role",
                      color: AppColor.white,
                      size: 17,
                      textDecoration: TextDecoration.none,
                      backgroundColor: AppColor.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),

            //Worker Registration Data
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: LabelText(text: "Worker Data"),
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
                  ),
                ),
              ),
            ),


            //admin tickets heading
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: LabelText(text: "Worker Tickets"),
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
