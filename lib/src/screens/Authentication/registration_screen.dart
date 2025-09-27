//import some libraries and files
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:startupproject/src/storage/common_widget/authentication/common_registration.dart';

//make stateful class for handling state
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //create some variables
  bool isLoading = false;
  String? selectedGender;
  String? selectedRole;
  final List<String> genderOptions = ['male', 'female', 'other'];
  final List<String> roleOptions = [
    'customer',
    'admin',
    'superAdmin',
    'employee',
    'worker',
  ];

  //create controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: kIsWeb
          ? CommonRegistration(
              nameController: nameController,
              passwordController: passwordController,
              addressController: addressController,
              codeController: codeController,
              selectedGender: selectedGender,
              selectedRole: selectedRole,
              genderOptions: genderOptions,
              roleOptions: roleOptions,
              isLoading: isLoading,
              onGenderChanged: (val) => setState(() => selectedGender = val!),
              onRoleChanged: (val) => setState(() => selectedRole = val!),
              updateState: (loading) {
                setState(() {
                  isLoading = loading;
                });
              },
            )
          : CommonRegistration(
              nameController: nameController,
              passwordController: passwordController,
              addressController: addressController,
              codeController: codeController,
              selectedGender: selectedGender,
              selectedRole: selectedRole,
              genderOptions: genderOptions,
              roleOptions: roleOptions,
              isLoading: isLoading,
              onGenderChanged: (val) => setState(() => selectedGender = val!),
              onRoleChanged: (val) => setState(() => selectedRole = val!),
              updateState: (loading) {
                setState(() {
                  isLoading = loading;
                });
              },
            ),
    );
  }
}
