//import some libraries and files
import 'package:flutter/material.dart';
import '../../storage/constant/constants.dart';
import '../../api/EmailVerification/send_otp.dart';
import '../snackbar.dart';

//create class controller for send otp function
Future<void> sendOtpScreenFunction({
  required BuildContext context,
  required TextEditingController emailController,
  required Function(bool isLoading, bool otpSend) updateState,
  required GlobalKey<FormState> formKey,
}) async {
  if (formKey.currentState!.validate()) {
    // Proceed with OTP logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sending OTP Wait...')),
    );
  }
  try {
    updateState(true, false);
    final email = emailController.text.trim();
    final response = await SendOtp.sendOtpFunction(email);
    if (response?.status == true) {
      updateState(false, true);
      SnackBarClass.snackBarFunction(
        context,
        "OTP Send Successfully",
        AppColor.blue,
      );
    }
    else if (response?.status == false && response?.message == 'Email Already Exists') {
      updateState(false, false);
      SnackBarClass.snackBarFunction(
        context,
        "Email Already Exists",
        AppColor.red,
      );
    }
    else {
      updateState(false, false);
      SnackBarClass.snackBarFunction(context, "OTP Not Send", AppColor.red);
    }
  } catch (e) {
    print("Exception:$e");
  }
}
