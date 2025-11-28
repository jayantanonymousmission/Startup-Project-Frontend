//import some libraries and files
import 'package:flutter/cupertino.dart';
import 'package:startupproject/src/api/TotalStatusCount/resolved.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/utility/snackbar.dart';

Future<void> totalStausControllerFunction({
  required BuildContext context,
  required Function(List<Map<String,dynamic>>) onValueFetched,
}) async {
  try {
    final response = await TotalStatusCount.totalStatusCountFunction();
    //checking condition
    if (response != null && response.isNotEmpty) {
      onValueFetched(response);
      print(response);
    }
  } catch (e) {
    print("Exception: $e");
    SnackBarClass.snackBarFunction(
      context,
      "Error fetching in status count",
      AppColor.red,
    );
  }
}