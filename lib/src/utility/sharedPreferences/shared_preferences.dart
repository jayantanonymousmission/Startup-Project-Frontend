//import some libraries and files
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:startupproject/src/screens/Authentication/email_verification.dart";
import "package:startupproject/src/screens/Authentication/login_screen.dart";
import "package:startupproject/src/screens/Authorization/admin.dart";
import "package:startupproject/src/screens/Authorization/customer.dart";
import "package:startupproject/src/screens/Authorization/employee.dart";
import "package:startupproject/src/screens/Authorization/super_admin.dart";
import "package:startupproject/src/screens/Authorization/worker.dart";

//create function for get value
Future<Widget> getSharedPreferences()async{
  var response=await SharedPreferences.getInstance();
  var token=response.getString("token");
  var role=response.getString("role");

  //check conditions
  if(token != null && role != null) {
    switch (role) {
      case "customer":
        return CustomerScreen();
      case "admin":
        return AdminScreen();
      case "superAdmin":
        return SuperAdminScreen();
      case "employee":
        return EmployeeScreen();
      case "worker":
        return WorkerScreen();
      default:
        return LoginScreen();
    }
  }
 return EmailVerificationScreen();
}