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
  bool isLoading=false;
  bool otpSend=false;
  
  //create controllers
  TextEditingController emailController=TextEditingController();
  
  //create function for handling operations
  Future<void> sendOtpScreenFunction()async{
    try{
      setState(() {
        isLoading=true;
      });
      final email=emailController.text.trim();
      final response=await SendOtp.sendOtpFunction(email);
      if(response?.status==true){
        setState(() {
          isLoading=false;
          otpSend=true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:Text("OTP Send Successfully",style:TextStyle(color:Colors.white)),
              backgroundColor:Colors.blue,)
        );
      }
      else if(response?.status==false){
        setState(() {
          isLoading=false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content:Text("OTP Not Send",style:TextStyle(color:Colors.white)),
              backgroundColor:Colors.red,)
        );
      }

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
