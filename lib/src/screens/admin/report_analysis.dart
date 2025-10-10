//import some libraries and files
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:startupproject/src/screens/Authorization/admin.dart';
import 'package:startupproject/src/screens/admin/customer.dart';
import 'package:startupproject/src/screens/admin/employee.dart';
import 'package:startupproject/src/screens/admin/worker.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/storage/custom_widgets/custom_card.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer_header.dart';
import 'package:startupproject/src/storage/custom_widgets/icon.dart';
import 'package:startupproject/src/storage/custom_widgets/list_tile.dart';
import 'package:startupproject/src/storage/custom_widgets/text_field.dart';
import 'package:startupproject/src/utility/sharedPreferences/shared_preferences.dart';

class ReportAnalysisOfAdmin extends StatefulWidget {
  const ReportAnalysisOfAdmin({super.key});
  @override
  State<ReportAnalysisOfAdmin> createState() =>
      _ReportAnalysisOfAdminState();
}

class _ReportAnalysisOfAdminState
    extends State<ReportAnalysisOfAdmin> {
  //create some list
  final Map<String, double> dataMap = {
    "Completed": 61,
    "Pending": 25,
    "Cancelled": 14,
  };
  final List<Color> colorList = [Colors.green, Colors.orange, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlueAccent),
      drawer: Drawers(
        children: [
          CustomDrawerHeader(name: "Jayant", email: "jayant62644@gmail.com"),
          ListTiles(text: "DashBoard", icon: Icons.home,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>AdminScreen()));},),
          Divider(),
          ListTiles(text: "Report Analysis", icon: Icons.analytics,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>ReportAnalysisOfAdmin()));},),
          Divider(),
          ListTiles(text: "Employees", icon: Icons.face,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>EmployeeInAdmin()));},),
          Divider(),
          ListTiles(text: "Workers", icon: Icons.face,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>WorkerInAdmin()));},),
          Divider(),
          ListTiles(text: "Customers", icon: Icons.face,callback:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>CustomerInAdmin()));},),
          Divider(),
          ListTiles(text: "Logout", icon: Icons.logout,callback:(){freeSharedPreferences(context);}),
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
            //Text("Super Admin Web"),
            //Card
            Card(
              color: Colors.red,
              child: LabelText(text: "Card"),
            ),
          ],
        ),
      )
          :
      //for app or desktop
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: LabelText(text: "Welcome to Report Analysis"),
            ),
            Wrap(
              children: [
                CustomCard(
                  width: 200,
                  height: 150,
                  color: AppColor.lightBlueAccent,
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
                        text: "Total Products:\n5000",
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
                        text: "Raw Product:\n5000",
                        color: AppColor.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                CustomCard(
                  width: 200,
                  height: 150,
                  color: AppColor.purpleAccent,
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
                        text: "Final Product:\n5000",
                        color: AppColor.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: LabelText(text: "Total Tickets and Products"),
            ),

            //make wave graph
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
            //create cards for showing details
            Wrap(
              children: [
                //for line graph
                CustomCard(
                  height: 200,
                  width: 250,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: LabelText(text: "Line Graph"),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            width: 20,
                            child: LinearProgressIndicator(
                              value: 1,
                              backgroundColor: Colors.grey[300],
                              color: AppColor.blue,
                            ),
                          ),
                        ),
                        LabelText(
                          text: "    Total Products",
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            width: 20,
                            child: LinearProgressIndicator(
                              value: 1,
                              backgroundColor: Colors.grey[300],
                              color: AppColor.orange,
                            ),
                          ),
                        ),
                        LabelText(
                          text: "    Total Tickets",
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                  ],
                ),

                //piechart
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: CustomCard(
                    height: 350,
                    width: 610,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: LabelText(text: "Pending Products"),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: PieChart(
                                PieChartData(
                                  sections: [
                                    PieChartSectionData(
                                      value: 40,
                                      title: '40%',
                                      color: Colors.orange,
                                      radius: 40,
                                      titleStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    PieChartSectionData(
                                      value: 60,
                                      title: '60%',
                                      color: Colors.blue,
                                      radius: 60,
                                      titleStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                  sectionsSpace: 2,
                                  centerSpaceRadius: 40,
                                ),
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: CustomCard(
                              height: 190,
                              width: 300,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: LabelText(text: "Pie Chart"),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: SizedBox(
                                        width: 20,
                                        child: LinearProgressIndicator(
                                          value: 1,
                                          backgroundColor:
                                          Colors.grey[300],
                                          color: AppColor.blue,
                                        ),
                                      ),
                                    ),
                                    LabelText(
                                      text: "    Final Product",
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: SizedBox(
                                        width: 20,
                                        child: LinearProgressIndicator(
                                          value: 1,
                                          backgroundColor:
                                          Colors.grey[300],
                                          color: AppColor.orange,
                                        ),
                                      ),
                                    ),
                                    LabelText(
                                      text: "    Raw Product",
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //pie chart 2
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: CustomCard(
                    height: 350,
                    width: 610,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: LabelText(text: "Pending Products"),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: PieChart(
                                PieChartData(
                                  sections: [
                                    PieChartSectionData(
                                      value: 40,
                                      title: '40%',
                                      color: Colors.orange,
                                      radius: 40,
                                      titleStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    PieChartSectionData(
                                      value: 60,
                                      title: '60%',
                                      color: Colors.blue,
                                      radius: 60,
                                      titleStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                  sectionsSpace: 2,
                                  centerSpaceRadius: 40,
                                ),
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: CustomCard(
                              height: 190,
                              width: 300,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: LabelText(text: "Pie Chart"),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: SizedBox(
                                        width: 20,
                                        child: LinearProgressIndicator(
                                          value: 1,
                                          backgroundColor:
                                          Colors.grey[300],
                                          color: AppColor.blue,
                                        ),
                                      ),
                                    ),
                                    LabelText(
                                      text: "    Final Product",
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: SizedBox(
                                        width: 20,
                                        child: LinearProgressIndicator(
                                          value: 1,
                                          backgroundColor:
                                          Colors.grey[300],
                                          color: AppColor.orange,
                                        ),
                                      ),
                                    ),
                                    LabelText(
                                      text: "    Raw Product",
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
