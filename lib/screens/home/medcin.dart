import 'package:firebase/screens/authenticate/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MedcinPage extends StatefulWidget {
  final User Medcin;
  MedcinPage({required this.Medcin});

  final FirebaseAuth _auth = FirebaseAuth.instance;
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
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.logout),
            label: Text('logout'),
            onPressed: () async {
              await widget._auth.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignIn(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome, Medcin! uid = ${widget.Medcin.uid}'),
      ),
    );
  }
}
