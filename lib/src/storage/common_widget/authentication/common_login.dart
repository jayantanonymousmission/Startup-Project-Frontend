//import some libraries and files
import 'package:flutter/material.dart';
import 'package:startupproject/src/screens/Authentication/email_verification.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/storage/custom_widgets/text_field.dart';
import '../../../utility/controllerFunctions/authentication/login.dart';

//create stateless class
class CommonLogin extends StatelessWidget {
  const CommonLogin({
    super.key,
    required this.isLoading,
    required this.emailController,
    required this.passwordController,
    required this.updateState,
  });
  //create some variables
  final bool isLoading;

  //create some controllers
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function(bool isLoading) updateState;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //column is used for align widget in vertically
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //use children for taking multiple widgets
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
            child: Center(child: Icon(Icons.account_box_outlined, size: 45)),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Center(child: LabelText(text: "Login")),
          ),
          //padding is used for give space to widget
          Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  if (isLoading)
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blue,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 6.0,
                      ),
                    ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: LabelText(
                        text: "Forgot Password",
                        color: AppColor.purple,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        onPressed: () => loginScreen(
                          emailController: emailController,
                          passwordController: passwordController,
                          updateState: updateState,
                          context: context,
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LabelText(
                            text: "If Email is Not Verified?",
                            color: AppColor.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EmailVerificationScreen(),
                                ),
                              );
                            },
                            child: LabelText(
                              text: "Email Verification",
                              color: AppColor.purple,
                              fontSize: 18,
                              textDecoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
