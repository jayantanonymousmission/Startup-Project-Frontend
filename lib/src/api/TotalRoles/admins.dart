//import some libraries and files
import 'dart:convert';
import 'package:http/http.dart' as http;

//create class
class TotalAdmins {
  //create total admins api
  static Future<int> totalAdminsFunction() async {
    //use exception handling for handling the data
    try {
      //create variables
      final uri = Uri.parse("http://10.183.99.138:5000/count/TotalAdmins");

      //use http post for putting the data to backend
      final response = await http.get(
        uri,
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        int fetchedData = data['countAdmins'] ?? 0;
        return fetchedData;
      } else {
        print('Error: ${response.statusCode}');
        return 0;
      }
    }catch(e){
      print(e);
      return 0;
    }
  }
}