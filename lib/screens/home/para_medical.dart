import 'package:flutter/material.dart';

class ParaMedicalPage extends StatefulWidget {
  @override
  _ParaMedicalPageState createState() => _ParaMedicalPageState();
}

class _ParaMedicalPageState extends State<ParaMedicalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ParaMedical'),
      ),
      body: Center(
        child: Text('Welcome, ParaMedical!'),
      ),
    );
  }
}
