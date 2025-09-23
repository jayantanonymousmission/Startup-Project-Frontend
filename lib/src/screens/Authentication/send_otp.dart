//import some libraries and files
import 'package:flutter/material.dart';
import 'package:startupproject/src/api/EmailVerification/send_otp.dart';

//make stateful class for handling state
class SendOtpScreen extends StatefulWidget {
  const SendOtpScreen({super.key});

  @override
  State<SendOtpScreen> createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  //create some variables
  final bool isLoading=false;
  final bool sendOtp=false;
  
  //create controllers
  TextEditingController emailController=TextEditingController();
  
  //create function for handling operations
  Future<void> sendOtpScreenFunction()async{
    try{
      final email=emailController.text.trim();
      final response=SendOtp.sendOtpFunction(email);
      print(response);

    }catch(e){
      print("Exception:$e");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(

      ),
      body:SingleChildScrollView(
        child:Column(
          children: [
            TextField(
              controller:emailController,
              decoration:InputDecoration(
                labelText:"Enter Email",
                border:OutlineInputBorder(),
              ),
            ),
            ElevatedButton(onPressed:sendOtpScreenFunction, child:Text("Send OTP"))
          ],
        ),
      ),
    );
  }
}
