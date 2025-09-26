//import some libraries and files
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:startupproject/src/api/EmailVerification/verify_otp.dart';
import 'package:startupproject/src/storage/custom_widgets/text_field.dart';
import 'package:startupproject/src/storage/custom_widgets/text_form_field.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/utility/controllerFunctions/authentication/resend_otp.dart';
import 'package:startupproject/src/utility/controllerFunctions/authentication/send_otp.dart';
import '../../../utility/controllerFunctions/authentication/verify_otp.dart';
import '../../validators/email_validation.dart';

//for app or web
class EmailVerification extends StatelessWidget {
  EmailVerification({super.key,
    required this.function,
    required this.formKey,
    required this.isLoading,
    required this.otpSend,
    required this.otpVerify,
    required this.sendUpdateState,
    required this.resendUpdateState,
    required this.verifyUpdateState,
    required this.emailController,
    required this.otpController,
  });
  //create some variables
  bool isLoading;
  bool otpSend;
  bool otpVerify;

  //create controllers
  final TextEditingController emailController;
  final TextEditingController otpController;
  final GlobalKey<FormState> formKey;
  final VoidCallback function;
  Function(bool isLoading, bool otpSend) sendUpdateState;
  Function(bool isLoading,bool otpVerify) verifyUpdateState;
  Function(bool isLoading) resendUpdateState;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Circle Avatar for circular image
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 30,
                child: Icon(Icons.email, color: Colors.white, size: 35),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child:LabelText(
                  text:"Please Verify You Email",
                  fontWeight:FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller:emailController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.blue),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                ),
                if (otpSend)
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child:LabelText(
                      text:"Enter OTP",
                      fontWeight:FontWeight.bold,
                      )
                    ),
                  ),
                if (otpSend)
                  Center(
                    child: PinCodeTextField(
                      maxLength: 6,
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      defaultBorderColor: Colors.redAccent,
                      hideCharacter: true,
                      highlightAnimation: true,
                      pinTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      pinBoxWidth: 50,
                      pinBoxHeight: 50,
                      pinBoxDecoration:
                          (
                          Color borderColor,
                          Color pinBoxColor, {
                        double borderWidth = 2.0,
                        double radius = 20,
                      }) {
                        return BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            radius,
                          ),
                          border: Border.all(
                            color: Colors.blue,
                            width: borderWidth,
                          ),
                        );
                      },
                    ),
                  ),
                if (isLoading)
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(
                      backgroundColor:AppColor.blue,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColor.white),
                      strokeWidth: 6.0,
                    ),
                  ),
                if (otpSend)
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 50,
                        child: TextButton(
                          onPressed: (otpSend && !otpVerify)
                              ?()=>resendOtpScreenFunction(context:context,emailController:emailController, updateState:resendUpdateState)
                              : null,
                          style: TextButton.styleFrom(
                            backgroundColor:AppColor.transparent,
                          ),
                          child:LabelText(text:"Resend OTP",color:AppColor.blue,fontSize:17,)
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        onPressed: (otpSend) ? null :()=>sendOtpScreenFunction(context:context,emailController: emailController, updateState: sendUpdateState, formKey: formKey),
                        style: TextButton.styleFrom(
                          backgroundColor: (otpSend)
                              ? Colors.grey
                              : Colors.blue,
                        ),
                        child:LabelText(text:"Send OTP",color:AppColor.white,fontSize:17)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        onPressed: (otpSend && !otpVerify)
                            ? ()=>verifyOtpScreenFunction(emailController: emailController, otpController: otpController, context: context, updateState:verifyUpdateState)
                            : null,
                        style: TextButton.styleFrom(
                          backgroundColor: (otpSend)
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        child:LabelText(text:"OTP Verify",fontSize:17,color:AppColor.white)
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LabelText(text:"If Email Already Verified?",color:AppColor.blue,fontWeight:FontWeight.bold),
                TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => RegistrationScreen(),
                    //   ),
                    // );
                  },
                  child:LabelText(text:"Registration",color:AppColor.blue,textDecoration:TextDecoration.underline)
                ),
              ],
            ),
          ],
        )
    );
  }
}