//import some libraries and files
import 'package:flutter/material.dart';

//create stateless class
class CustomTextField extends StatelessWidget {
  //create custom variables
  final String text;
  final TextEditingController controller;
  final GlobalKey<FormState>  formKey;
  final String? Function(String?) ? validation;
  const CustomTextField({super.key,required this.text,required this.controller,required this.formKey,this.validation});

  @override
  Widget build(BuildContext context) {
    //return Padding for giving space
    return Padding(
      padding:EdgeInsets.all(20),
      child: Form(
        //form key is used for apply validation
        key:formKey,
        //use text form field for taking use input
        child: TextFormField(
          //controller for capturing input form text form field,
          controller:controller,
          //validation is used for which type of validation are you perform,its a function
          validator:validation,
          decoration: InputDecoration(
              labelText:text,
              labelStyle:TextStyle(color:Colors.blue),
              enabledBorder:OutlineInputBorder(
                  borderSide:BorderSide(
                    color:Colors.blue,
                    width:2,
                    style: BorderStyle.solid,
                  )
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              )
          ),
        ),
      ),
    );
  }
}
