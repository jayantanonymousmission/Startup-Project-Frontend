import 'package:flutter/material.dart';

class SuperAdminScreen extends StatefulWidget {
  const SuperAdminScreen({super.key});

  @override
  State<SuperAdminScreen> createState() => _SuperAdminScreenState();
}

class _SuperAdminScreenState extends State<SuperAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(),
        body:Text("SuperAdmin")
    );
  }
}
