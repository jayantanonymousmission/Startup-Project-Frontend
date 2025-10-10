//import some libraries and files
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:startupproject/src/screens/Authorization/admin.dart';
import 'package:startupproject/src/screens/Authorization/super_admin.dart';
import 'package:startupproject/src/screens/admin/customer.dart';
import 'package:startupproject/src/screens/admin/employee.dart';
import 'package:startupproject/src/screens/admin/report_analysis.dart';
import 'package:startupproject/src/screens/admin/worker.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/storage/custom_widgets/custom_card.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer_header.dart';
import 'package:startupproject/src/storage/custom_widgets/icon.dart';
import 'package:startupproject/src/storage/custom_widgets/list_tile.dart';
import 'package:startupproject/src/storage/custom_widgets/text_button.dart';
import 'package:startupproject/src/storage/custom_widgets/text_field.dart';
import 'package:startupproject/src/utility/sharedPreferences/shared_preferences.dart';

class ViewAllTicketsOfAdmin extends StatefulWidget {
  const ViewAllTicketsOfAdmin({super.key});
  @override
  State<ViewAllTicketsOfAdmin> createState() => _ViewAllTicketsOfAdminState();
}

class _ViewAllTicketsOfAdminState extends State<ViewAllTicketsOfAdmin> {
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
                MaterialPageRoute(builder: (context) =>AdminScreen()),
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
                  builder: (context) => ReportAnalysisOfAdmin(),
                ),
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
                MaterialPageRoute(builder: (context) => EmployeeInAdmin()),
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
                MaterialPageRoute(builder: (context) => WorkerInAdmin()),
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
                MaterialPageRoute(builder: (context) => CustomerInAdmin()),
              );
            },
          ),
          Divider(),
          ListTiles(text: "Logout", icon: Icons.logout,callback:(){freeSharedPreferences(context);},),
          Divider(),
          ListTiles(text: "Back", icon: Icons.arrow_forward_ios,callback:(){Navigator.pop(context);},),
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
              child: LabelText(text: "Welcome to Admin Tickets"),
            ),

            Wrap(
              children: [
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
                        text: "Total Tickets:\n5000",
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
                        text: "Problem Solved:\n5000",
                        color: AppColor.white,
                        fontWeight:FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //heading of recently tickets
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: LabelText(text: "Recently Tickets"),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: CustomTextButton(
                      callback: () {},
                      text: "Generate",
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
                      callback: () {},
                      text: "Update",
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
                      callback: () {},
                      text: "Delete",
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
                      callback: () {},
                      text: "Notification",
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
            //make wave graph for tickets
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 250,
                width: double.infinity,
                child: LineChart(
                  LineChartData(
                    minY: 0,
                    maxY: 800,
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        axisNameWidget: LabelText(text: "Years"),
                        axisNameSize: 40,
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const months = [
                              '2014',
                              '2015',
                              '2016',
                              '2017',
                              '2018',
                              '2019',
                              '2020',
                              '2021',
                              '2022',
                              '2023',
                              '2024',
                              '2025',
                            ];
                            return Text(
                              months[value.toInt() % 12],
                              style: TextStyle(fontSize: 10),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true),
                      ),
                    ),
                    gridData: FlGridData(show: true),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      // 🔶 Revenue Line
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 400),
                          FlSpot(1, 450),
                          FlSpot(2, 500),
                          FlSpot(3, 550),
                          FlSpot(4, 500),
                          FlSpot(5, 650),
                          FlSpot(6, 10),
                          FlSpot(7, 50),
                          FlSpot(8, 500),
                          FlSpot(9, 20),
                          FlSpot(10, 100),
                          FlSpot(11, 10),
                        ],
                        isCurved: true,
                        color: Colors.orange,
                        barWidth: 3,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.withOpacity(0.4),
                              Colors.orange.withOpacity(0.1),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),

                      // 🔷 Expense Line
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 200),
                          FlSpot(1, 250),
                          FlSpot(2, 300),
                          FlSpot(3, 350),
                          FlSpot(4, 400),
                          FlSpot(5, 420),
                          FlSpot(6, 100),
                          FlSpot(7, 440),
                          FlSpot(8, 450),
                          FlSpot(9, 560),
                          FlSpot(10, 470),
                          FlSpot(11, 880),
                        ],
                        isCurved: true,
                        color: Colors.blue,
                        barWidth: 3,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.withOpacity(0.4),
                              Colors.blue.withOpacity(0.1),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
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
