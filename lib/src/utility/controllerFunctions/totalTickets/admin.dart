//import some libraries and files
import 'package:flutter/cupertino.dart';
import 'package:startupproject/src/api/totalTickets/totalTicketsOfEmployee.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/utility/snackbar.dart';

Future<void> totalTicketOfEmployeeControllerFunction({
  required BuildContext context,
  required Function(int) onValueFetched,
}) async {
  try {
    final response = await TotalTicketsOfEmployee.totalTicketsOfEmployeeFunction();

    if (response > 0) {
      onValueFetched(response);
    }
  } catch (e) {
    print("Exception: $e");
    SnackBarClass.snackBarFunction(
      context,
      "Error fetching in Employees count",
      AppColor.red,
    );
  }
}