//import some libraries and files
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../api/EmailVerification/verify_otp.dart';

Future<void> verifyOtpScreenFunction({
  required TextEditingController emailController,
  required TextEditingController otpController,
  required BuildContext context,
  required Function(bool isLoading,bool otpVerify) updateState,
}) async {
  updateState(true,false);
  final email = emailController.text.trim();
  final otpText = otpController.text.trim();
  if (otpText.isEmpty || !RegExp(r'^\d+$').hasMatch(otpText)) {
    updateState(false,false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Please enter a valid numeric OTP"),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }
  final otp = int.parse(otpText);
  final response = await VerifyOtp.verifyOtpFunction(
    email,
    otp,
  );
  if (response?.status == true) {
    updateState(false,true);
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => RegistrationScreen()),
    // );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Email Verified",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  } else if (response?.status == false &&
      response?.message == "Email Not Exist") {
    updateState(false,false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Email Not Exist"), backgroundColor: Colors.red),
    );
  } else if (response?.status == false &&
      response?.message == "OTP Expired") {
    updateState(false,false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("OTP Expired"), backgroundColor: Colors.red),
    );
  } else if (response?.status == false &&
      response?.message == "User Already Verified") {
    updateState(false,false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("User Already Verified"),
        backgroundColor: Colors.red,
      ),
    );
  } else if (response?.status == false &&
      response?.message == "Invalid OTP") {
    updateState(false,false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Invalid OTP"), backgroundColor: Colors.red),
    );
  } else {
    updateState(false,false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Email Not Verified"),
        backgroundColor: Colors.red,
      ),
    );
  }
}