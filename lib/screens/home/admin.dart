import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  final User Admin;
  AdminPage({required this.Admin});

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Welcome, Admin!  uid = ${widget.Admin.uid}'),
      ),
    );
  }
}
