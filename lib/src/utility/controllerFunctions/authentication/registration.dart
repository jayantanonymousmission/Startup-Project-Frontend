//import some libraries and files
import "package:flutter/material.dart";

import "../../../api/Registration/registration.dart";

Future<void> registrationScreen({
  required TextEditingController nameController,
  required TextEditingController passwordController,
  required TextEditingController addressController,
  required TextEditingController codeController,
  required String selectedGender,
  required String selectedRole,
  required BuildContext context,
  required Function(bool isLoading) updateState,
}) async {
    updateState(true);
    //assign controllers to variables
    final name=nameController.text.trim();
    final password=passwordController.text.trim();
    final gender=selectedGender;
    final address=addressController.text.trim();
    final role=selectedRole;
    final code=codeController.text.trim();
  //putting controllers to registrationFunction
  final response = await Registration.registrationFunction(
    name,
    password,
    gender,
    address,
    role,
    code,
  );
  print(response?.message);
  //checking conditions
  if (response?.status == true) {
    updateState(false);
    if (response?.role == "customer") {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoginScreen()),
      // );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Registered Successfully",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
      );
    }
    if (response?.role == 'admin' && response?.code == "@admin_open_12380091_Code") {
      updateState(false);
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoginScreen()),
      // );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Registered Successfully",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
      );
    }
    else if (response?.role == 'superAdmin' && response?.code == "@@abcSuper_admin_1200874213_Code") {
      updateState(false);
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoginScreen()),
      // );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Registered Successfully",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
      );
    }
    else if (response?.role == 'employee' && response?.code == "@employees_ka_gate_394893_kholo_yaar") {
      updateState(false);
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoginScreen()),
      // );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Registered Successfully",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
      );
    }
    else if (response?.role == 'worker' && response?.code == "@worker_code_@321") {
      updateState(false);
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoginScreen()),
      // );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Registered Successfully",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
      );
    }
  }
  else if (response?.status == false && response?.message == "Email Not Verified") {
    updateState(false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Email Not Verified",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
    );
  } else if (response?.status == false && response?.message == "User already Registered") {
    updateState(false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "User already Registered",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
    );
  } else if (response?.status == false && response?.message == "Password Not Encrypted") {
    updateState(false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Password Not Encrypted",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }else if (response?.status == false && response?.message == "Invalid Role and Code") {
    updateState(false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Invalid Role and Code",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
  else if (response?.status == false && response?.message == "Unauthorized role or invalid code") {
    updateState(false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Unauthorized role or invalid code",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
  else {
    updateState(false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "You are not Registered!Check Details again",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}