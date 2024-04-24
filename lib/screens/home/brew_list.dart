import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/models/brew.dart';
import 'package:firebase/models/user.dart';
import 'package:firebase/screens/home/brew_tile.dart';
import 'package:firebase/screens/home/user_tile.dart';
import 'package:firebase/services/database.dart';
import 'package:firebase/shared/loading.dart';
import 'package:flutter/material.dart';

class BrewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<USER>>(
      stream: DatabaseService().utilisateurs,
      builder: (BuildContext context, AsyncSnapshot<List<USER>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.data == null) {
          return Loading();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<USER> utilisateurs = snapshot.data!;
          utilisateurs.forEach((utilisateur) {
            print(utilisateur.role);
          });

          // Replace this with your implementation to display the list of brews
          return ListView.builder(
              itemCount: utilisateurs.length,
              itemBuilder: (context, index) {
                return UserTile(utilisateur: utilisateurs[index]);
              });
        }
      },
    );
  }
}
