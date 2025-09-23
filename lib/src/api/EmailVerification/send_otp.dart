//import some libraries and files
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../models/EmailVerification/email_verification_model.dart';

//create class
class SendOtp {
  //create email verification api function for handling http requests
  static Future<Email_Verification_Model?> sendOtpFunction(String email) async {
    //use exception handling for handling the data
    try {
      final uri=
      //? Uri.parse("http://localhost:5000/auth/sendOtp")
      //? //Uri.parse("https://startup-project-backend.onrender.com/auth/sendOtp")
      Uri.parse("http://localhost:5000/auth/sendOtp");
      //use http post for putting the data to backend
      print(uri);
      final response = await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email}),
      );
      //use json decode for finding useful information from json
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Email_Verification_Model.fromJson(data);
      } else {
        return Email_Verification_Model(message: "Server error", status: false);
      }

      //final data = jsonDecode(response.body);
      //return Email_Verification_Model.fromJson(data);
    }catch(e){
      return Email_Verification_Model(message:"Exception:\n $e",status:false);
    }
  }
}