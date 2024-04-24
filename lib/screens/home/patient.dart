import 'package:flutter/material.dart';

class PatientPage extends StatefulWidget {
  @override
  _PatientPageState createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient'),
      ),
      body: Center(
        child: Text('Welcome, Patient!'),
      ),
    );
  }
}
