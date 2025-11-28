//import some libraries and files
import 'package:flutter/cupertino.dart';
import 'package:startupproject/src/api/RecentlyTickets/recentlyTicketsOfCustomers.dart';
import 'package:startupproject/src/models/Tickting/tickting.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/utility/snackbar.dart';

Future<void> recentlyTicketsOfCustomerControllerFunction({
  required BuildContext context,
  required Function(List<TicktingModel>) onValueFetched,
}) async {
  try {
    final response = await RecentlyTicketsOfCustomers.recentlyTicketsOfCustomersFunction();

    if (response != null && response.isNotEmpty) {
      onValueFetched(response);
    }
  } catch (e) {
    print("Exception: $e");
    SnackBarClass.snackBarFunction(
      context,
      "Error fetching in recently tickets",
      AppColor.red,
    );
  }
}