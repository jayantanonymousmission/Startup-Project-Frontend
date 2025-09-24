//import some libraries and files
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:startupproject/src/storage/validators/email_validation.dart';

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

  Widget textFields(){
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(child:Column(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: CircleAvatar(
              backgroundColor:Colors.blueAccent,
              minRadius:30,
              child:Icon(Icons.mail,color:Colors.white,size:38),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Please Verify your Email",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)),
          ),

          Padding(
            padding:EdgeInsets.all(20),
            child: Form(
              key:_formKey,
              child: TextFormField(
                controller: emailController,
                validator:validateEmail,
                decoration: InputDecoration(
                  labelText: "Enter Email",
                   labelStyle:TextStyle(color:Colors.blue),
                   enabledBorder:OutlineInputBorder(
                       borderSide:BorderSide(
                         color:Colors.blue,
                         width:2,
                         style: BorderStyle.solid,
                       )
                   ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    )
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width:double.infinity,
              height: 50,
              child: TextButton(
                  onPressed: handleSendOTP,
                  style:TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor:Colors.white,
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(10)
                    ),
                  ),

                  child: Text("Send OTP",style:TextStyle(fontSize:20))
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                Text("If you are already signup?",style:TextStyle(fontSize:20)),
                TextButton(
                  onPressed: () {  },
                  child:Text("SignIn",style:TextStyle(fontSize:20,color:Colors.purple,decoration:TextDecoration.underline),))
              ],),
            )
          ]))
        ],
      )
    );
  }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(),

          body:kIsWeb?
              textFields()
              :
              textFields()


      // SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Form(
      //         key:_formKey,
      //         child: TextFormField(
      //           controller: emailController,
      //            validator:validateEmail,
      //           decoration: InputDecoration(
      //             labelText: "Enter Email",
      //             border: OutlineInputBorder(),
      //           ),
      //         ),
      //       ),
      //       ElevatedButton(onPressed: handleSendOTP, child: Text("Send OTP")),
      //     ],
      //   ),
      // ),
      );
    }
  }
