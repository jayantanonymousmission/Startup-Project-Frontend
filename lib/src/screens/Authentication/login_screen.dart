//import some libraries and files
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:startupproject/src/storage/common_widget/authentication/common_login.dart';

//make stateful class for handling state
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //create some variables
  bool isLoading = false;

  //create controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: kIsWeb
          ? CommonLogin(
        isLoading:isLoading,
        emailController:emailController,
        passwordController:passwordController,
        updateState:(loading){
          setState(() {
            isLoading=loading;
          });
        }
      )
      : CommonLogin(
          isLoading:isLoading,
          emailController:emailController,
          passwordController:passwordController,
          updateState:(loading){
            setState(() {
              isLoading=loading;
            });
          }
      )
    );
  }
}
