//import some libraries and files
import 'package:flutter/material.dart';
import 'package:startupproject/src/storage/custom_widgets/text_field.dart';
import 'package:startupproject/src/storage/custom_widgets/text_form_field.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import '../validators/email_validation.dart';

//for app or web
class SendOTP extends StatelessWidget {
  SendOTP({super.key,required this.function,required this.controller,required this.formKey});
  //create some variables
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  minRadius: 30,
                  child: Icon(Icons.mail, color:AppColor.white, size: 38),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child:LabelText(text:"Please Verify your Email")
              ),
              Form(
                child: CustomTextField(text: "Email",
                  controller:controller,
                  formKey: formKey,
                  validation: validateEmail
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                      onPressed:function,
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      child:LabelText(text:"Send OTP",color:AppColor.white,)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabelText(text:"If you are already signup?"),
                    TextButton(
                        onPressed: () {},
                        child:LabelText(
                          text:"SignIn", color:AppColor.purple, textDecoration: TextDecoration.underline
                        )
                    )
                  ]),
              )
            ]))
          ],
        )
    );
  }
}