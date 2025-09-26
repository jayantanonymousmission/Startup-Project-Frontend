import 'package:flutter/material.dart';
import '../../../api/EmailVerification/resend_otp.dart';
import '../../../storage/constant/constants.dart';
import '../../snackbar.dart';

Future<void> resendOtpScreenFunction({
  required BuildContext context,
  required TextEditingController emailController,
  required Function(bool isLoading) updateState,
}) async {
  updateState(true);
  final email = emailController.text.trim();
  final response = await ResendOtp.resendOtpFunction(email);
  if (response?.status == true) {
    updateState(false);
    SnackBarClass.snackBarFunction(context,"OTP Resend Successfully",AppColor.blue);
  } else if (response?.status == false &&
      response?.message == "Email Not Found") {
    updateState(false);
    SnackBarClass.snackBarFunction(context,"Email Not Found",AppColor.red);
  } else if (response?.status == false &&
      response?.message == "OTP Not Found!First Request for OTP") {
    updateState(false);
    SnackBarClass.snackBarFunction(context,"OTP Not Found!First Request for OTP",AppColor.red);
  } else {
    updateState(false);
    SnackBarClass.snackBarFunction(context,"OTP Resend Failed",AppColor.red);
  }
}