import 'package:firebase/screens/authenticate/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ParaMedicalPage extends StatefulWidget {
  final User ParaMedical;
  ParaMedicalPage({required this.ParaMedical});

  final FirebaseAuth _auth = FirebaseAuth.instance;
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
        child: Text('Welcome, ParaMedical!  uid = ${widget.ParaMedical.uid}'),
      ),
    );
  }
}
