//Create Registration Model for convert raw data into json
class RegistrationModel{
  //create variables
  final String ? name;
  final String ? password;
  final String ? gender;
  final String ? address;
  final String ? role;
  final String ? code;
  final String ? message;
  final bool ? status;
  //create constructor
  RegistrationModel({ this.name, this.password, this.gender, this.address,this.role,this.code,this.message,this.status});
  //create factory function for convert raw data into json
  factory RegistrationModel.fromJson(Map<String,dynamic>json){
    return RegistrationModel(
      name:json['name']?.toString(),
      password:json['password']?.toString(),
      gender:json['gender']?.toString(),
      address:json['address']?.toString(),
      role:json['role']?.toString(),
      code:json['code']?.toString(),
      message: json['message']?.toString() ??
          (json['errors'] is List && json['errors'].isNotEmpty
              ? json['errors'].join(", ")
              : "No message received"),
      status: json['status'] is bool
          ? json['status']
          : (json['status']?.toString().toLowerCase() == "true"),
    );
  }
}