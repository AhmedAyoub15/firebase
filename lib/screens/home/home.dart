import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/screens/home/brew_list.dart';
import 'package:firebase/services/auth.dart';
import 'package:firebase/services/database.dart';
import 'package:firebase/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brew');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Brew Crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: DatabaseService().brews,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.data == null) {
              return Loading();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              QuerySnapshot brews = snapshot.data!;
              // Your widget that uses the snapshot data
              // Replace Container() with your widget
              // print(brews);
              // print(brews.docs);
              // Print the documents of the QuerySnapshot
              for (var doc in brews.docs) {
                print('Document data: ${doc.data()}');
                // Print each field of the document
                print(doc['name']);
              }

              return Container();
            }
          }),
    );
  }
}
