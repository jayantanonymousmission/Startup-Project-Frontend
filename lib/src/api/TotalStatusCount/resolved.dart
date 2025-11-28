//import some libraries and files
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//create class
class TotalStatusCount {
  //create resolved api
  static Future<List<Map<String, dynamic>>?> totalStatusCountFunction() async {
    //use exception handling for handling the data
    try {
      //create variables
      final uri = Uri.parse("http://10.183.99.138:5000/count/totalNumberOfStatus");
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      //use http get for putting the data to backend
      final response = await http.get(
        uri,
        headers: {"Authorization":"Bearer $token"},
      );
      print(response.body);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic>fetchedData =data['count'];
        //return fetchedData.map((e) => TicktingModel.fromJson(e)).toList();
        // convert to simple list of map (no TicktingModel)
        return fetchedData
            .map((e) => {
          "status": e["_id"], // backend field
          "count": e["count"]
        })
            .toList();
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