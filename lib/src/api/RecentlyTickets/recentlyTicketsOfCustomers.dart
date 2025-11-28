//import some libraries and files
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startupproject/src/models/Tickting/tickting.dart';

//create class
class RecentlyTicketsOfCustomers{
  //create recently tickets of api
  static Future<List<TicktingModel>?> recentlyTicketsOfCustomersFunction() async {
    //create variable
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    //use exception handling for handling the data
    try {
      //create variables
      final uri = Uri.parse("http://10.183.99.138:5000/count/recentlyRoleBasedTickets/customer");

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
        final data = jsonDecode(response.body);
        final List<dynamic>fetchedData = data['recentlyTickets'];
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