//import some library and files
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/Registration/registration.dart';

//Create class for handling http request or taking raw data from api
class LoginModel{
  //create function for extracting raw data
  static Future<RegistrationModel?> loginFunction(String email,String password) async{
    //use try catch for handling errors
    try {
      //create variables
      final uri=Uri.parse("http://localhost:5000/auth/login");

      //for handling post request use post method
      final response =await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      //json decode is used for converting json data to flutter data
      final data = jsonDecode(response.body);
      return RegistrationModel.fromJson(data);

    }catch(e){
      return RegistrationModel(message:"Exception:$e",status:false);
    }
  }
}