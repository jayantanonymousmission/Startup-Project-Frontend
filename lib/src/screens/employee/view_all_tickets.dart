//import some libraries and files
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:startupproject/src/api/TicketsCurdOperation/Generate/generate.dart';
import 'package:startupproject/src/models/Tickting/tickting.dart';
import 'package:startupproject/src/screens/Authorization/employee.dart';
import 'package:startupproject/src/screens/employee/customer.dart';
import 'package:startupproject/src/screens/employee/report_analysis.dart';
import 'package:startupproject/src/screens/employee/worker.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/storage/custom_widgets/custom_card.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer.dart';
import 'package:startupproject/src/storage/custom_widgets/drawer_header.dart';
import 'package:startupproject/src/storage/custom_widgets/icon.dart';
import 'package:startupproject/src/storage/custom_widgets/list_tile.dart';
import 'package:startupproject/src/storage/custom_widgets/text_button.dart';
import 'package:startupproject/src/storage/custom_widgets/text_field.dart';
import 'package:startupproject/src/storage/custom_widgets/text_form_field.dart';
import 'package:startupproject/src/utility/controllerFunctions/totalStatus/totalStatus.dart';
import 'package:startupproject/src/utility/controllerFunctions/totalTickets/admin.dart';
import 'package:startupproject/src/utility/sharedPreferences/shared_preferences.dart';
import '../../api/TicketsCurdOperation/delete/delete.dart';
import '../../api/TicketsCurdOperation/update/update.dart';
import '../../utility/controllerFunctions/recentlyTIckets/recentlyTicketsOfEmployee.dart';

class ViewAllTicketsOfEmployee extends StatefulWidget {
  const ViewAllTicketsOfEmployee({super.key});
  @override
  State<ViewAllTicketsOfEmployee> createState() =>
      _ViewAllTicketsOfEmployeeState();
}

class _ViewAllTicketsOfEmployeeState extends State<ViewAllTicketsOfEmployee> {
  //create some variable
  int totalTickets = 0;
  List<Map<String, dynamic>> totalStatus = [];
  List<TicktingModel>? ticketData = [];
  String selectedStatus = 'open';
  String selectedComplaintLevel = 'low';
  String selectedCategoryType = "delivery_issue";
  final _formKey = GlobalKey<FormState>();

  //create controllers
  TextEditingController ticketIdController=TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController complaintDateController = TextEditingController();
  TextEditingController productNumberController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController complaintLevelController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController categoryTypeController = TextEditingController();
  TextEditingController complaintTitleController = TextEditingController();
  TextEditingController complaintDescriptionController = TextEditingController();
  TextEditingController productImageController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //Total tickets
    totalTicketOfEmployeeControllerFunction(
      context: context,
      onValueFetched: (value) {
        if(mounted) {
          setState(() {
            totalTickets = value;
          });
        }
      },
    );
    //Total Status
    totalStausControllerFunction(
      context: context,
      onValueFetched: (value) {
        if(mounted) {
          setState(() {
            totalStatus = value;
          });
        }
      },
    );
    //Recently Tickets
    recentlyTicketsOfEmployeeControllerFunction(
      context: context,
      onValueFetched: (List<TicktingModel> data) {
        if(mounted) {
          setState(() {
            ticketData = data;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  //controller functions
  //generate ticket
  void generateTicket() async {
    final ticket = await GenerateTicket.generateTicketFunction(
      int.parse(mobileController.text.trim()),
      complaintDateController.text.trim(),
      int.parse(productNumberController.text.trim()),
      productNameController.text.trim(),
      selectedComplaintLevel,
      selectedStatus,
      selectedCategoryType,
      complaintTitleController.text.trim(),
      complaintDescriptionController.text.trim(),
      productImageController.text.trim(),
      commentController.text.trim(),
    );
    //checking conditions
    final messenger = ScaffoldMessenger.of(
      Navigator.of(context, rootNavigator: true).context,
    );

    if (ticket != null) {
      messenger.showSnackBar(
        SnackBar(
          content: Text("Ticket Successfully Generated"),
          backgroundColor: AppColor.blueAccent,
        ),
      );
      Navigator.pop(context); // Close the dialog after success
    } else {
      messenger.showSnackBar(
        SnackBar(
          content: Text("Ticket Not Generated"),
          backgroundColor: AppColor.red,
        ),
      );
    }
  }

  //update ticket
  void updateTicket() async {
    final ticket = await UpdateTicket.updateTicketFunction(
      ticketIdController.text.trim(),
      int.parse(mobileController.text.trim()),
      int.parse(productNumberController.text.trim()),
      productNameController.text.trim(),
      selectedComplaintLevel,
      selectedCategoryType,
      complaintTitleController.text.trim(),
      complaintDescriptionController.text.trim(),
      productImageController.text.trim(),
      commentController.text.trim(),
    );
    //checking conditions
    final messenger = ScaffoldMessenger.of(
      Navigator.of(context, rootNavigator: true).context,
    );

    if (ticket != null) {
      messenger.showSnackBar(
        SnackBar(
          content: Text("Ticket Successfully Updated"),
          backgroundColor: AppColor.blueAccent,
        ),
      );
      Navigator.pop(context); // Close the dialog after success
    } else {
      messenger.showSnackBar(
        SnackBar(
          content: Text("Ticket Not Updated"),
          backgroundColor: AppColor.red,
        ),
      );
    }
  }

  //delete ticket
  void deleteTicket() async {
    final ticket = await DeleteTicket.deleteTicketFunction(
      ticketIdController.text.trim(),
    );
    //checking conditions
    final messenger = ScaffoldMessenger.of(
      Navigator.of(context, rootNavigator: true).context,
    );

    if (ticket != null) {
      messenger.showSnackBar(
        SnackBar(
          content: Text("Ticket Successfully Deleted"),
          backgroundColor: AppColor.blueAccent,
        ),
      );
      Navigator.pop(context); // Close the dialog after success
    } else {
      messenger.showSnackBar(
        SnackBar(
          content: Text("Ticket Not Delete"),
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
          ListTiles(
            text: "DashBoard",
            icon: Icons.home,
            callback: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmployeeScreen()),
              );
            },
          ),
          Divider(),
          ListTiles(
            text: "View All Tickets",
            icon: Icons.home,
            callback: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewAllTicketsOfEmployee(),
                ),
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
                  builder: (context) => ReportAnalysisOfEmployee(),
                ),
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
                MaterialPageRoute(builder: (context) => WorkerInEmployee()),
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
                MaterialPageRoute(builder: (context) => CustomerInEmployee()),
              );
            },
          ),
          Divider(),
          ListTiles(
            text: "Logout",
            icon: Icons.logout,
            callback: () {
              freeSharedPreferences(context);
            },
          ),
          Divider(),
          ListTiles(
            text: "Back",
            icon: Icons.arrow_forward_ios,
            callback: () {
              Navigator.pop(context);
            },
          ),
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
              child: LabelText(text: "Welcome to Employee Tickets"),
            ),

            Wrap(
              children: [
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
                        text: "Total Tickets:\n$totalTickets",
                        color: AppColor.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                CustomCard(
                  width: 200,
                  height: 250,
                  color: AppColor.orange,
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
                        text: "Total Status:\n$formattedStatusText",
                        color: AppColor.white,
                        fontWeight: FontWeight.normal,
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
                      callback: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: LabelText(text: "Generate Ticket"),
                                  ),
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        CustomTextField(
                                          text: "Enter Mobile Number",
                                          controller: mobileController,
                                          validation: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomTextField(
                                          text: "Complaint Date",
                                          controller: complaintDateController,
                                          validation: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomTextField(
                                          text: "Product Number",
                                          controller: productNumberController,
                                          validation: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomTextField(
                                          text: "Product Name",
                                          controller: productNameController,
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
                                            value: selectedComplaintLevel,
                                            items: ['low', 'medium', 'high']
                                                .map(
                                                  (level) => DropdownMenuItem(
                                                    value: level,
                                                    child: Text(level),
                                                  ),
                                                )
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                selectedComplaintLevel = value!;
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
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child:
                                              DropdownButtonFormField<String>(
                                                value: selectedStatus,
                                                items:
                                                    [
                                                          'open',
                                                          'in_progress',
                                                          'resolved',
                                                          'closed',
                                                        ]
                                                        .map(
                                                          (status) =>
                                                              DropdownMenuItem(
                                                                value: status,
                                                                child: Text(
                                                                  status,
                                                                ),
                                                              ),
                                                        )
                                                        .toList(),
                                                onChanged: (data) {
                                                  setState(() {
                                                    selectedStatus = data!;
                                                  });
                                                },
                                                decoration: InputDecoration(
                                                  labelText: "Status",
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors.blue,
                                                          width: 2,
                                                        ),
                                                      ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors.blue,
                                                          width: 2,
                                                        ),
                                                      ),
                                                  errorBorder:
                                                      OutlineInputBorder(
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
                                                validator: (value) =>
                                                    value == null
                                                    ? 'Please select a status'
                                                    : null,
                                              ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: DropdownButtonFormField<String>(
                                            value: selectedCategoryType,
                                            items:
                                                [
                                                      'delivery_issue',
                                                      'productive_defective',
                                                      'warranty_claim',
                                                      'service_request',
                                                    ]
                                                    .map(
                                                      (type) =>
                                                          DropdownMenuItem(
                                                            value: type,
                                                            child: Text(type),
                                                          ),
                                                    )
                                                    .toList(),
                                            onChanged: (data) {
                                              setState(() {
                                                selectedCategoryType = data!;
                                              });
                                            },
                                            decoration: InputDecoration(
                                              labelText: "Category Type",
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
                                                ? 'Please select a status'
                                                : null,
                                          ),
                                        ),
                                        CustomTextField(
                                          text: "Complaint Title",
                                          controller: complaintTitleController,
                                          validation: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomTextField(
                                          text: "Complaint Description",
                                          controller:
                                              complaintDescriptionController,
                                          validation: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomTextField(
                                          text: "Product Image",
                                          controller: productImageController,
                                          validation: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomTextField(
                                          text: "Comment",
                                          controller: commentController,
                                          validation: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
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
                                                generateTicket();
                                              }
                                            },
                                            text: "Generate",
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
                      callback: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: LabelText(text: "Update Ticket"),
                                  ),
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        CustomTextField(
                                          text: "Enter TicketId",
                                          controller:ticketIdController,
                                          validation: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomTextField(
                                          text: "Enter Mobile Number",
                                          controller: mobileController,
                                          validation: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomTextField(
                                          text: "Product Number",
                                          controller: productNumberController,
                                          validation: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomTextField(
                                          text: "Product Name",
                                          controller: productNameController,
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
                                            value: selectedComplaintLevel,
                                            items: ['low', 'medium', 'high']
                                                .map(
                                                  (level) => DropdownMenuItem(
                                                value: level,
                                                child: Text(level),
                                              ),
                                            )
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                selectedComplaintLevel = value!;
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
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: DropdownButtonFormField<String>(
                                            value: selectedCategoryType,
                                            items:
                                            [
                                              'delivery_issue',
                                              'productive_defective',
                                              'warranty_claim',
                                              'service_request',
                                            ]
                                                .map(
                                                  (type) =>
                                                  DropdownMenuItem(
                                                    value: type,
                                                    child: Text(type),
                                                  ),
                                            )
                                                .toList(),
                                            onChanged: (data) {
                                              setState(() {
                                                selectedCategoryType = data!;
                                              });
                                            },
                                            decoration: InputDecoration(
                                              labelText: "Category Type",
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
                                                ? 'Please select a status'
                                                : null,
                                          ),
                                        ),
                                        CustomTextField(
                                          text: "Complaint Title",
                                          controller: complaintTitleController,
                                          validation: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomTextField(
                                          text: "Complaint Description",
                                          controller:
                                          complaintDescriptionController,
                                          validation: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomTextField(
                                          text: "Product Image",
                                          controller: productImageController,
                                          validation: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
                                        ),
                                        CustomTextField(
                                          text: "Comment",
                                          controller: commentController,
                                          validation: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
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
                                                updateTicket();
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
                      callback: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: LabelText(text: "Delete Ticket"),
                                  ),
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        CustomTextField(
                                          text: "Enter TicketId",
                                          controller:ticketIdController,
                                          validation: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
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
                                                deleteTicket();
                                              }
                                            },
                                            text: "Delete",
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
                      text: "Delete",
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
                    columns: const [
                      DataColumn(label: LabelText(text: 'Ticket ID')),
                      DataColumn(label: LabelText(text: 'Product Name')),
                      DataColumn(label: LabelText(text: 'Mobile Number')),
                      DataColumn(label: LabelText(text: 'Complaint Title')),
                      DataColumn(label: LabelText(text: 'Status')),
                    ],
                    rows: ticketData!.map((ticket) {
                      return DataRow(
                        cells: [
                          DataCell(
                            LabelText(
                              text: ticket.ticket_id ?? '',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: ticket.product_name ?? '',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: ticket.mobile_number?.toString() ?? '',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: ticket.complaint_title ?? '',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          DataCell(
                            LabelText(
                              text: ticket.status ?? '',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
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
                    maxY: 450,
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        axisNameWidget: LabelText(text: "Years"),
                        axisNameSize: 40,
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const months = [
                              "2025",
                              "2026",
                              "2027",
                              "2028",
                              "2029",
                              "2030"
                            ];
                            return Text(
                              months[value.toInt() % months.length],
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
                     //Tickets Line
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 200),
                          FlSpot(1, 250),
                          FlSpot(2, 300),
                          FlSpot(3, 350),
                          FlSpot(4, 400),
                          FlSpot(5, 420),
                        ],
                        isCurved: true,
                        color: Colors.blue,
                        barWidth: 3,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              Colors.green,
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
