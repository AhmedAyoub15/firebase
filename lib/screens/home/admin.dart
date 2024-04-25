import 'package:firebase/screens/authenticate/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  final User Admin;
  AdminPage({required this.Admin});

  final FirebaseAuth _auth = FirebaseAuth.instance;

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
        child: Text('Welcome, Admin!  uid = ${widget.Admin.uid}'),
      ),
    );
  }
}
