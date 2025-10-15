//import some libraries and files
import 'dart:convert';
import 'package:http/http.dart' as http;

//create class
class TotalWorkers {
  //create total workers api
  static Future<int> totalWorkersFunction() async {
    //use exception handling for handling the data
    try {
      //create variables
      final uri = Uri.parse("http://192.168.31.247:5000/count/TotalWorkers");

      //use http post for putting the data to backend
      final response = await http.get(
        uri,
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        int fetchedData = data['countWorkers'] ?? 0;
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