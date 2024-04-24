import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/screens/home/admin.dart';
import 'package:firebase/screens/home/home.dart';
import 'package:firebase/screens/home/medcin.dart';
import 'package:firebase/screens/home/para_medical.dart';
import 'package:firebase/screens/home/patient.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void routeToPageBasedOnRole(BuildContext context) {
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance
      .collection('utilisateurs')
      .doc(user!.uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      String? role = documentSnapshot.get('role');
      print("role in routing is : $role");
      switch (role) {
        case 'Admin':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminPage(
                Admin: user,
              ),
            ),
          );
          break;
        case 'Medcin':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MedcinPage(
                Medcin: user,
              ),
            ),
          );
          break;
        case 'Patient':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PatientPage(
                Patient: user,
              ),
            ),
          );
          break;
        case 'ParaMedical':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ParaMedicalPage(
                ParaMedical: user,
              ),
            ),
          );
          break;
        // Add more cases here for other roles
        default:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
      }
    }
  });
}
