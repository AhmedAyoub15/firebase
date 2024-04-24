import 'package:firebase/models/user.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final USER utilisateur;
  UserTile({required this.utilisateur});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text('User_Role: ${utilisateur.role!}'),
          subtitle: Text('UserId: ${utilisateur.uid} '),
        ),
      ),
    );
  }
}
