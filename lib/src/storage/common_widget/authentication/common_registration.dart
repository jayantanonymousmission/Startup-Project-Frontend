//import some libraries and functions
import 'package:flutter/material.dart';
import 'package:startupproject/src/screens/Authentication/email_verification.dart';
import 'package:startupproject/src/screens/Authentication/login_screen.dart';
import 'package:startupproject/src/storage/constant/constants.dart';
import 'package:startupproject/src/storage/custom_widgets/text_field.dart';

import '../../../utility/controllerFunctions/authentication/registration.dart';
class CommonRegistration extends StatelessWidget {
  const CommonRegistration({
    super.key,
    required this.nameController,
    required this.passwordController,
    required this.addressController,
    required this.codeController,
    required this.selectedGender,
    required this.selectedRole,
    required this.genderOptions,
    required this.roleOptions,
    required this.isLoading,
    required this.onGenderChanged,
    required this.onRoleChanged,
    required this.updateState
  });

  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController addressController;
  final TextEditingController codeController;
  final String ? selectedGender;
  final String ? selectedRole;
  final List<String> genderOptions;
  final List<String> roleOptions;
  final Function(bool isLoading) updateState;
  final bool isLoading;

  final ValueChanged<String?> onGenderChanged;
  final ValueChanged<String?> onRoleChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            //Heading
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Icon(Icons.contact_page_outlined,size:45,),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(child: LabelText(text:"Registration")),
            ),
            // Name field
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Password field
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password(UpperCase,LowerCase,specialCharacter or Number,MinLength:6)",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Gender dropdown
            Padding(
              padding: const EdgeInsets.all(10),
              child: DropdownButtonFormField<String>(
                value: selectedGender != "" ? selectedGender : null,
                items: genderOptions
                    .map((gender) => DropdownMenuItem(
                  value: gender,
                  child: Text(gender),
                ))
                    .toList(),
                onChanged: onGenderChanged,
                decoration: const InputDecoration(
                  labelText: "Gender",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Address field
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: "Address(Min Length:6)",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Role dropdown
            Padding(
              padding: const EdgeInsets.all(10),
              child: DropdownButtonFormField<String>(
                value: selectedRole,
                items: roleOptions
                    .map((role) => DropdownMenuItem(
                  value: role,
                  child: Text(role),
                ))
                    .toList(),
                onChanged: onRoleChanged,
                decoration: const InputDecoration(
                  labelText: "Role",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Code field (only if role != customer)
            if (selectedRole != "customer")
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: codeController,
                  decoration: const InputDecoration(
                    labelText: "Code",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

            // Loading indicator
            if (isLoading)
              const Padding(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 6.0,
                ),
              ),

            // SignUp button
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                height:45,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape:RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(5)
                      ),
                  ),
                  onPressed:()=>registrationScreen(
                      nameController:nameController,
                      passwordController: passwordController,
                      addressController: addressController,
                      codeController: codeController,
                      selectedGender: selectedGender ?? "",
                      selectedRole: selectedRole ?? "",
                      context: context,
                      updateState: updateState),
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.white,fontSize:20),
                  ),
                ),
              ),
            ),

            // SignIn button
            SingleChildScrollView(
                scrollDirection:Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LabelText(text:"If your are already Registered?",color:AppColor.blue,fontSize:15,fontWeight:FontWeight.bold),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>LoginScreen(),
                              ),
                            );
                          },
                          child:LabelText(text:"Login",color:AppColor.purple,fontSize:18,textDecoration:TextDecoration.underline)
                      ),
                    ],
                  ),
                ),
              ),
            SingleChildScrollView(
              scrollDirection:Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LabelText(text:"If Email is not Verified?",color:AppColor.blue,fontSize:15,fontWeight:FontWeight.bold),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>EmailVerificationScreen(),
                          ),
                        );
                      },
                      child:LabelText(text:"Email Verification",color:AppColor.purple,fontSize:18,textDecoration:TextDecoration.underline)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}