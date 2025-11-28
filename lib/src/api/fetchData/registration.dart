//import some libraries and files
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startupproject/src/models/Registration/registration.dart';

//create class
class RegistrationUserdata{
  //create recently tickets of api
  static Future<List<RegistrationModel>?>registrationUserDataFunction() async {
    //create variable
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    //use exception handling for handling the data
    try {
      //create variables
      final uri = Uri.parse("http://10.183.99.138:5000/data/registrationData");

      //use http post for putting the data to backend
      final response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      //checking condition
      if (response.statusCode == 200) {
        // final data = jsonDecode(response.body);
        // print(data);
        final data = jsonDecode(response.body);
        final userData = RegistrationModel.fromJson(data['userData']);
        return [userData]; // Wrap in a list if function expects List<RegistrationModel>

      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    }catch(e){
      print(e);
      return null;
    }
  }
}