import 'package:flutter/cupertino.dart';
import 'package:startupproject/src/api/TotalRoles/admins.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/utility/snackbar.dart';

Future<void> totalAdminRoleControllerFunction({
  required BuildContext context,
  required Function(int) onValueFetched,
}) async {
  try {
    final response = await TotalAdmins.totalAdminsFunction();

    if (response > 0) {
      onValueFetched(response);
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