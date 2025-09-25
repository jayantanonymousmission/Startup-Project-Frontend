//import some libraries and files
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:startupproject/src/storage/common_widget/send_otp.dart';
import '../../utility/controllerFunctions/sendOtp.dart';

//make stateful class for handling state
class SendOtpScreen extends StatefulWidget {
  const SendOtpScreen({super.key});

  @override
  State<SendOtpScreen> createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  //create some variables
  bool isLoading = false;
  bool otpSend = false;

  //create controllers
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  //create function for handling operations
  void handleSendOTP() {
    sendOtpScreenFunction(
      context: context,
      emailController: emailController,
      updateState: (loading, sent) {
        setState(() {
          isLoading = loading;
          otpSend = sent;
        });
      },
      formKey:_formKey,
    );
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(),

          body:kIsWeb?
              SendOTP(function:handleSendOTP, controller:emailController, formKey:_formKey,)
              :
              SendOTP(function:handleSendOTP, controller:emailController, formKey:_formKey,)
      );
    }
  }
