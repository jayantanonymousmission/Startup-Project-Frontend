//import some libraries and files
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/EmailVerification/email_verification_model.dart';

//create class
class SendOtp {
  //create email verification api function for handling http requests
  static Future<EmailVerificationModel?> sendOtpFunction(String email) async {
    //use exception handling for handling the data
    try {
      //create variables
      final uri = Uri.parse("http://localhost:5000/auth/sendOtp");

      //use http post for putting the data to backend
      final response = await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email}),
      );

      //json decode is used for converting json data to flutter data
      final data = jsonDecode(response.body);
      return EmailVerificationModel.fromJson(data);

    }catch(e){
      return EmailVerificationModel(message:"Exception:\n $e",status:false);
    }
  }
}