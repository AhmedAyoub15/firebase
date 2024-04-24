import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PatientPage extends StatefulWidget {
  final User Patient;
  PatientPage({required this.Patient});
  @override
  _PatientPageState createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient '),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Welcome, Patient!  uid = ${widget.Patient.uid}'),
      ),
    );
  }
}
