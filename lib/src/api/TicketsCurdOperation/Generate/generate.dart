//import some libraries and files
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startupproject/src/models/Tickting/tickting.dart';


//Create class for taking raw data from api
class GenerateTicket{
  //Create Future function for handling http requests
  static Future<TicktingModel?> generateTicketFunction(
      int mobileNumber,
      String complaintDate,
      int productNumber,
      String productName,
      String complaintLevel,
      String status,
      String categoryType,
      String complaintTitle,
      String complaintDescription,
      String productImage,
      String comment,
      )async{
    //use try catch for handling errors
    try {
      //create variables
      final uri = Uri.parse("http://10.183.99.138:5000/ticket/generateTicket");
      final pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      // for hitting post request so use http.post
      final response = await http.post(
        //pass api url to uri.parse
          uri,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          //jsonEncode is used for abstracting data from api
          body: jsonEncode({
            "mobile_number": mobileNumber,
            "complaint_date": complaintDate,
            "product_number": productNumber,
            "product_name": productName,
            "complaint_level": complaintLevel,
            "status": status,
            "category_type": categoryType,
            "complaint_title": complaintTitle,
            "complaint_description": complaintDescription,
            "product_image": productImage,
            "comment": comment,
          })
      );

      //json decode means converting json data to flutter data
      final data = jsonDecode(response.body);
      //checking conditions
      if (data['status'] == true) {
        // Return the model only if success
        final response= TicktingModel.fromJson(data["ticket"]);
        return response;
      }
     return null;
    }catch(e){
      print(e);
     return null;
    }
  }
}
