import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MedcinPage extends StatefulWidget {
  final User Medcin;
  MedcinPage({required this.Medcin});
  @override
  _MedcinPageState createState() => _MedcinPageState();
}

class _MedcinPageState extends State<MedcinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medcin'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Welcome, Medcin! uid = ${widget.Medcin.uid}'),
      ),
    );
  }
}
