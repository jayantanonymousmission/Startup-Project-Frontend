//import some libraries and files
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startupproject/src/screens/Authorization/customer.dart';
import 'package:startupproject/src/screens/Authorization/admin.dart';
import 'package:startupproject/src/screens/Authorization/super_admin.dart';
import 'package:startupproject/src/screens/Authorization/employee.dart';
import 'package:startupproject/src/screens/Authorization/worker.dart';
import '../../../api/Login/login.dart';


Future<void> loginScreen({
  //create some variables and controllers
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required Function(bool isLoading) updateState,
  required BuildContext context,
})async{
  //initialize the controller
  final email = emailController.text.trim();
  final password = passwordController.text.trim();
  //update the state
  updateState(true);
  //call login model function
  final response=await LoginModel.loginFunction(email,password);
  //initialize the token and role
  final token=response?.token;
  final role=response?.role;
  //set shared preference for storing value
  final data=await SharedPreferences.getInstance();

  //checking conditions
  if(role!=null && token != null && response?.status==true){
    updateState(false);
    await data.setString("token", token);
    await data.setString("role", role);
    if(response?.role=='customer') {
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>CustomerScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Login Successfully",style:TextStyle(color:Colors.white)),backgroundColor:Colors.blue));
    }
    else if(response?.role=='admin'){
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>AdminScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Login Successfully",style:TextStyle(color:Colors.white)),backgroundColor:Colors.blue));
    }
    else if(response?.role=='superAdmin'){
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>SuperAdminScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Login Successfully",style:TextStyle(color:Colors.white)),backgroundColor:Colors.blue));
    }
    else if(response?.role=='employee'){
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>EmployeeScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Login Successfully",style:TextStyle(color:Colors.white)),backgroundColor:Colors.blue));
    }
    else if(response?.role=='worker'){
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>WorkerScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Login Successfully",style:TextStyle(color:Colors.white)),backgroundColor:Colors.blue));
    }
  }
  else if(response?.status==false && response?.message=="User Not Found"){
    updateState(false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("User Not Found",style:TextStyle(color:Colors.white)),backgroundColor:Colors.red));
  }
  else if(response?.status==false && response?.message=="Invalid Credentials"){
    updateState(false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Invalid Credentials",style:TextStyle(color:Colors.white)),backgroundColor:Colors.red));
  }
  else{
    updateState(false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Something went wrong",style:TextStyle(color:Colors.white)),backgroundColor:Colors.red));
  }
}