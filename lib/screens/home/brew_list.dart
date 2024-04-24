import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/models/brew.dart';
import 'package:firebase/screens/home/brew_tile.dart';
import 'package:firebase/services/database.dart';
import 'package:firebase/shared/loading.dart';
import 'package:flutter/material.dart';

class BrewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Brew>>(
      stream: DatabaseService().brews,
      builder: (BuildContext context, AsyncSnapshot<List<Brew>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.data == null) {
          return Loading();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Brew> brews = snapshot.data!;
          brews.forEach((brew) {
            print(brew.name);
            print(brew.sugars);
          });

          // Replace this with your implementation to display the list of brews
          return ListView.builder(
            itemCount: brews.length,
            itemBuilder: (context, index) {
              return BrewTile(brew: brews[index]);
            },
          );
        }
      },
    );
  }
}
