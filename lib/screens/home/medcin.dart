import 'package:flutter/material.dart';

class MedcinPage extends StatefulWidget {
  @override
  _MedcinPageState createState() => _MedcinPageState();
}

class _MedcinPageState extends State<MedcinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medcin'),
      ),
      body: Center(
        child: Text('Welcome, Medcin!'),
      ),
    );
  }
}
