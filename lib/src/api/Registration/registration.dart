//import some libraries and files
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/Registration/registration.dart';

//Create class for taking raw data from api
class Registration{
  //Create Future function for handling http requests
  static Future<RegistrationModel?> registrationFunction(String name,String password,String gender,String address,String role,String code)async{
    //use try catch for handling errors
    try {
      // for hitting post request so use http.post
      final response = await http.post(
        //pass api url to uri.parse
          Uri.parse("http://localhost:5000/auth/register"),
          headers: {"Content-Type": "application/json"},
          //jsonEncode is used for abstracting data from api
          body: jsonEncode({
            "name": name,
            "password": password,
            "gender": gender,
            "address": address,
            "role": role,
            "code": code
          })
      );
      //json decode means to decode the data
      final data=jsonDecode(response.body);
      return RegistrationModel.fromJson(data);
    }catch(e){
      return RegistrationModel(message:"Exception:$e",status:false);
    }
  }
}
