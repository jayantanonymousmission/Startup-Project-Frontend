//import some libraries and files
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/EmailVerification/email_verification_model.dart';

class VerifyOtp{
  static Future<Email_Verification_Model?> verifyOtpFunction(String email,int otp)async{
    try {
      final response = await http.post(
          Uri.parse("http://localhost:5000/auth/verifyOtp"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"email": email, "otp": otp})
      );
      final data = jsonDecode(response.body);
      return Email_Verification_Model.fromJson(data);
    }catch(e){
      return Email_Verification_Model(message:"Exception:$e",status:false);
      return null;
    }
  }
}