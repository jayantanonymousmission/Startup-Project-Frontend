
//Create Tickting Model for convert raw data into json
class TicktingModel{
  //create variables
  final String ? ticket_id;
  final int ? mobile_number;
  final int ? product_number;
  final String ? product_name;
  final String ? complaint_level;
  final String ? status;
  final String ? category_type;
  final String ? complaint_title;
  final String ? complaint_description;
  final String ? product_image;
  final String ? comment;
  //create constructor
  TicktingModel({
    this.ticket_id,
    this.mobile_number,
    this.product_number,
    this.product_name,
    this.complaint_level,
    this.status,
    this.category_type,
    this.complaint_title,
    this.complaint_description,
    this.product_image,
    this.comment,
  });

  //create factory function for convert raw data into json
  factory TicktingModel.fromJson(Map<String,dynamic>json){
    return TicktingModel(
      ticket_id:json['ticket_id']?.toString(),
      mobile_number:json['mobile_number'] != null ? int.tryParse(json['mobile_number'].toString()) : null,
      product_number:json['product_number'] != null ? int.tryParse(json['product_number'].toString()) : null,
      product_name:json['product_name']?.toString(),
      complaint_level:json['complaint_level']?.toString(),
      status:json['status']?.toString(),
      category_type:json['category_type']?.toString(),
      complaint_title:json['complaint_title']?.toString(),
      complaint_description: json['complaint_description'],
      product_image:json['product_image']?.toString() ,
      comment:json['comment']?.toString(),
    );
  }
}