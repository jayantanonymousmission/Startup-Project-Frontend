//import some libraries and files
import 'package:flutter/cupertino.dart';
import 'package:startupproject/src/api/fetchData/registration.dart';
import 'package:startupproject/src/models/Registration/registration.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/utility/snackbar.dart';

Future<void> registrationUserDataControllerFunction({
  required BuildContext context,
  required Function(List<RegistrationModel>) onValueFetched,
}) async {
  try {
    final response = await RegistrationUserdata.registrationUserDataFunction();

    if (response != null && response.isNotEmpty) {
      onValueFetched(response);
    }
  } catch (e) {
    print("Exception: $e");
    SnackBarClass.snackBarFunction(
      context,
      "Error fetching in registration user data",
      AppColor.red,
    );
  }
}