//import some libraries and files
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startupproject/src/models/Tickting/tickting.dart';

//create class
class RecentlyTickets{
   //create recently tickets of api
  static Future<List<TicktingModel>?> recentlyTicketsFunction() async {
    //create variable
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    //use exception handling for handling the data
    try {
      //create variables
      final uri = Uri.parse("http://192.168.31.247:5000/count/recentlyRoleBasedTickets");

      //use http post for putting the data to backend
      final response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic>fetchedData = data['recentlyTickets'];
        print(fetchedData);
        return fetchedData.map((e) => TicktingModel.fromJson(e)).toList();

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