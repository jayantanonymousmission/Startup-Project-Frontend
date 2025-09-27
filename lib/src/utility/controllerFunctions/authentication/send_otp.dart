//import some libraries and files
import 'package:flutter/material.dart';
import '../../../storage/constant/constants.dart';
import '../../../api/EmailVerification/send_otp.dart';
import '../../snackbar.dart';

//create class controller for send otp function
Future<void> sendOtpScreenFunction({
  required BuildContext context,
  required TextEditingController emailController,
  required Function(bool isLoading, bool otpSend) updateState,
  required GlobalKey<FormState> formKey,
}) async {
  if (formKey.currentState != null && formKey.currentState!.validate()) {
    // Proceed with OTP logic
    SnackBarClass.snackBarFunction(context,"Sending OTP Wait",AppColor.white);
  }
    updateState(true, false);
    final email = emailController.text.trim();
    final response = await SendOtp.sendOtpFunction(email);

  try {
    if (response?.status == true) {
      updateState(false, true);
      SnackBarClass.snackBarFunction(context,"OTP Send Successfully",AppColor.blue);
    }

    else if (response?.status == false && response?.message == 'Email Already Exist') {
      updateState(false, false);
      SnackBarClass.snackBarFunction(context,"Email Already Exist",AppColor.red);
    }
    else {
      updateState(false, false);
      SnackBarClass.snackBarFunction(context, "OTP Not Send!Please Check Email", AppColor.red);
    }
  } catch (e) {
    print("Exception:$e");
  }
}
