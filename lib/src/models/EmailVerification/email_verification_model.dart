//make class to handle raw data from backend json
import 'package:flutter/foundation.dart';

class Email_Verification_Model{
  //create variables
  final String ? email;
  final int ? otp;
  final bool ? status;
  final String ? message;

  //Make Constructor for taking parameters
  Email_Verification_Model({this.email,this.otp,this.status,this.message});

  //Make Factory functions to convert json into dart code
  factory Email_Verification_Model.fromJson(Map<String,dynamic>json){
    return Email_Verification_Model(
      email:json['email'].toString(),
      otp:json['otp'] != null ? int.tryParse(json['otp'].toString()) : null,
      status:json['status'] is bool ? json['status']:(json['status']?.toString().toLowerCase()=="true"),
      message:json['message'].toString(),
    );
  }
}
