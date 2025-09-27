
//make class to handle raw data from backend json
class EmailVerificationModel{
  //create variables
  final String ? email;
  final int ? otp;
  final bool ? status;
  final String ? message;

  //Make Constructor for taking parameters
  EmailVerificationModel({this.email,this.otp,this.status,this.message});

  //Make Factory functions to convert json into dart code
  factory EmailVerificationModel.fromJson(Map<String,dynamic>json){
    return EmailVerificationModel(
      email:json['email'].toString(),
      otp:json['otp'] != null ? int.tryParse(json['otp'].toString()) : null,
      status:json['status'] is bool ? json['status']:(json['status']?.toString().toLowerCase()=="true"),
      message:json['message'].toString(),
    );
  }
}
