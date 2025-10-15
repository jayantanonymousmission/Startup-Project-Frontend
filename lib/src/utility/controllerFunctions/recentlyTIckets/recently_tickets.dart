import 'package:flutter/cupertino.dart';
import 'package:startupproject/src/api/RecentlyTickets/employee.dart';
import 'package:startupproject/src/models/Tickting/tickting.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/utility/snackbar.dart';

Future<void> recentlyTicketsControllerFunction({
  required BuildContext context,
  required Function(List<TicktingModel>) onValueFetched,
}) async {
  try {
    final response = await RecentlyTickets.recentlyTicketsFunction();

    if (response != null && response.isNotEmpty) {
      onValueFetched(response);
    } else {
      SnackBarClass.snackBarFunction(
        context,
        "No Admins found",
        AppColor.red,
      );
    }
  } catch (e) {
    print("Exception: $e");
    SnackBarClass.snackBarFunction(
      context,
      "Error fetching in Admins count",
      AppColor.red,
    );
  }
}