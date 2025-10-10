//import some libraries and files
import 'package:flutter/material.dart';
import 'package:startupproject/src/screens/Authorization/super_admin.dart';
import 'package:startupproject/src/screens/super_admin/admin.dart';
import 'package:startupproject/src/screens/super_admin/customer.dart';
import 'package:startupproject/src/screens/super_admin/report_analysis.dart';
import 'package:startupproject/src/screens/super_admin/worker.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/storage/custom_widgets/custom_card.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer_header.dart';
import 'package:startupproject/src/storage/custom_widgets/icon.dart';
import 'package:startupproject/src/storage/custom_widgets/list_tile.dart';
import 'package:startupproject/src/storage/custom_widgets/text_button.dart';
import 'package:startupproject/src/storage/custom_widgets/text_field.dart';
import 'package:startupproject/src/utility/sharedPreferences/shared_preferences.dart';

class EmployeeInSuperAdmin extends StatefulWidget {
  const EmployeeInSuperAdmin({super.key});
  @override
  State<EmployeeInSuperAdmin> createState() => _EmployeeInSuperAdminState();
}

class _EmployeeInSuperAdminState extends State<EmployeeInSuperAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlueAccent),
      drawer: Drawers(
        children: [
          CustomDrawerHeader(name: "Jayant", email: "jayant62644@gmail.com"),
          ListTiles(
            text: "DashBoard",
            icon: Icons.home,
            callback: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SuperAdminScreen()),
              );
            },
          ),
          Divider(),
          ListTiles(
            text: "Report Analysis",
            icon: Icons.analytics,
            callback: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReportAnalysisOfSuperAdmin(),
                ),
              );
            },
          ),
          Divider(),
          ListTiles(
            text: "Admin",
            icon: Icons.face,
            callback: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminInSuperAdmin()),
              );
            },
          ),
          Divider(),
          ListTiles(
            text: "Employees",
            icon: Icons.face,
            callback: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmployeeInSuperAdmin()),
              );
            },
          ),
          Divider(),
          ListTiles(
            text: "Workers",
            icon: Icons.face,
            callback: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WorkerInSuperAdmin()),
              );
            },
          ),
          Divider(),
          ListTiles(
            text: "Customers",
            icon: Icons.face,
            callback: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomerInSuperAdmin()),
              );
            },
          ),
          Divider(),
          ListTiles(text: "Logout", icon: Icons.logout,callback:(){freeSharedPreferences(context);},),
          Divider(),
          ListTiles(text: "Back", icon: Icons.arrow_back_ios,callback:(){Navigator.pop(context);},),
          Divider(),
        ],
      ),
      //for web
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: LabelText(text: "Employee Data Panel"),
            ),

            //work assign to admin through super admin
            Wrap(
              children: [
                CustomCard(
                  width: 200,
                  height: 150,
                  color: AppColor.blueAccent,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: CustomIcon(
                          icon: Icons.account_box_outlined,
                          size: 30,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: LabelText(
                        text: "Total Employee:\n5000",
                        color: AppColor.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),

                // total salary
                CustomCard(
                  width: 200,
                  height: 150,
                  color: AppColor.pinkAccent,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: CustomIcon(
                          icon: Icons.account_balance_wallet_rounded,
                          color: AppColor.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: LabelText(
                        text: "Employee Salary:\n5000",
                        color: AppColor.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                CustomCard(
                  width: 200,
                  height: 150,
                  color: AppColor.pinkAccent,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: CustomIcon(
                          icon: Icons.account_box_outlined,
                          size: 30,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: LabelText(
                        text: "Solved Tickets:\n5000",
                        color: AppColor.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                CustomCard(
                  width: 200,
                  height: 150,
                  color: AppColor.green,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: CustomIcon(
                          icon: Icons.account_box_outlined,
                          size: 30,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: LabelText(
                        text: "Pending Tickets:\n5000",
                        color: AppColor.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),

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
                  //SizedBox(width:20),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 30, 10),
                    child: CustomTextButton(
                      callback: () {},
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

            //Admin Registration Data
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: LabelText(text: "Employee Data"),
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
              child: LabelText(text: "Employee Tickets"),
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
