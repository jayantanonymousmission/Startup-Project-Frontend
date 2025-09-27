import 'package:flutter/material.dart';
import 'package:startupproject/src/screens/Authentication/email_verification.dart';
import 'package:startupproject/src/utility/sharedPreferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:FutureBuilder<Widget>(
        future: getSharedPreferences(), // 👈 context pass karo
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text("Something went wrong")),
            );
          }

          if (snapshot.hasData) {
            return snapshot.data!; // 👈 yahan tumhara Customer/Admin... screen milega
          }

          return EmailVerificationScreen(); // default fallback
        },
      )

    );
  }
}
