//import some libraries and files
import 'package:flutter/cupertino.dart';
import 'package:startupproject/src/api/TotalRoles/workers.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/utility/snackbar.dart';

Future<void> totalWorkersRoleControllerFunction({
  required BuildContext context,
  required Function(int) onValueFetched,
}) async {
  try {
    final response = await TotalWorkers.totalWorkersFunction();

    if (response > 0) {
      onValueFetched(response);
    } else {
      SnackBarClass.snackBarFunction(
        context,
        "No Workers found",
        AppColor.red,
      );
    }
  } catch (e) {
    print("Exception: $e");
    SnackBarClass.snackBarFunction(
      context,
      "Error fetching in workers count",
      AppColor.red,
    );
  }
}