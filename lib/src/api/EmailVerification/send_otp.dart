//import some libraries and files
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/EmailVerification/email_verification_model.dart';

//create class
class SendOtp {
  //create email verification api function for handling http requests
  static Future<Email_Verification_Model?> sendOtpFunction(String email) async {
    //use exception handling for handling the data
    try {
      //use http post for putting the data to backend
      final response = await http.post(
        Uri.parse(""),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email}),
      );
      //use json decode for finding useful information from json
      final data = jsonDecode(response.body);
      return Email_Verification_Model.fromJson(data);
    }catch(e){
      return Email_Verification_Model(message:"Exception:\n $e",status:false);
    }
  }
}