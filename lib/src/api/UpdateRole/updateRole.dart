//import some libraries and files
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startupproject/src/models/Registration/registration.dart';


//Create class for taking raw data from api
class UpdateRole{
  //Create Future function for handling http requests
  static Future<RegistrationModel?> updateRoleFunction(
      String id,
      String role,
      )async{
    //use try catch for handling errors
    try {
      //create variables
      final uri = Uri.parse("http://10.183.99.138:5000/role/updateRole");
      final pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      // for hitting post request so use http.post
      final response = await http.put(
        //pass api url to uri.parse
          uri,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          //jsonEncode is used for abstracting data from api
          body: jsonEncode({
            "id":id,
            "role":role
          })
      );

      //json decode means converting json data to flutter data
      final data = jsonDecode(response.body);
      //checking conditions
      if (data['status'] == true) {
        // Return the model only if success
        final response= RegistrationModel.fromJson(data["existingUser"]);
        return response;
      }
      return null;
    }catch(e){
      print(e);
      return null;
    }
  }
}
