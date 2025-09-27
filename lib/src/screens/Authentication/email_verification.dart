//import some libraries and files
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:startupproject/src/storage/common_widget/authentication/common_email_verification.dart';

//make stateful class for handling state
class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  //create some variables
  bool isLoading = false;
  bool otpSend = false;
  bool otpVerify = false;

  //create controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: kIsWeb
          ? CommonEmailVerification(
              formKey: _formKey,
              isLoading: isLoading,
              otpSend: otpSend,
              otpVerify: otpVerify,
              sendUpdateState: (loading, sent) {
                setState(() {
                  isLoading = loading;
                  otpSend = sent;
                });
              },
              resendUpdateState: (loading) {
                setState(() {
                  isLoading = loading;
                });
              },
              verifyUpdateState: (loading, sent) {
                setState(() {
                  isLoading = loading;
                  otpVerify = sent;
                });
              },
              emailController: emailController,
              otpController: otpController,
            )
          : CommonEmailVerification(
              formKey: _formKey,
              isLoading: isLoading,
              otpSend: otpSend,
              otpVerify: otpVerify,
              sendUpdateState: (loading, sent) {
                setState(() {
                  isLoading = loading;
                  otpSend = sent;
                });
              },
              resendUpdateState: (loading) {
                setState(() {
                  isLoading = loading;
                });
              },
              verifyUpdateState: (loading, sent) {
                setState(() {
                  isLoading = loading;
                  otpVerify = sent;
                });
              },
              emailController: emailController,
              otpController: otpController,
            ),
    );
  }
}
