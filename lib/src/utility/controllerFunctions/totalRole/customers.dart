import 'package:flutter/cupertino.dart';
import 'package:startupproject/src/api/TotalRoles/customers.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/utility/snackbar.dart';

Future<void> totalCustomerRoleControllerFunction({
  required BuildContext context,
  required Function(int) onValueFetched,
}) async {
  try {
    final response = await TotalCustomers.totalCustomersFunction();

    if (response > 0) {
      onValueFetched(response);
    } else {
      SnackBarClass.snackBarFunction(
        context,
        "No customers found",
        AppColor.red,
      );
    }
  } catch (e) {
    print("Exception: $e");
    SnackBarClass.snackBarFunction(
      context,
      "Error fetching in customers count",
      AppColor.red,
    );
  }
}