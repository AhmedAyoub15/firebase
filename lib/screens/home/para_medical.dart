import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ParaMedicalPage extends StatefulWidget {
  final User ParaMedical;
  ParaMedicalPage({required this.ParaMedical});
  @override
  _ParaMedicalPageState createState() => _ParaMedicalPageState();
}

class _ParaMedicalPageState extends State<ParaMedicalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ParaMedical'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Welcome, ParaMedical!  uid = ${widget.ParaMedical.uid}'),
      ),
    );
  }
}
