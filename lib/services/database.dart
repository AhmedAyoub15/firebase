import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/models/brew.dart';
import 'package:firebase/models/user.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('utilisateurs');

  Future updateUserData(String role, String name) async {
    return await userCollection.doc(uid).set({
      'role': role,
      'userId': uid,
      'username': name,
    });
  }

  // brew list from snapshot
  List<USER> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data);

      return USER(
        uid: doc['userId'],
        role: doc['role'],
      );
    }).toList();
  }

  //setup a stream to listen to any change in the database
//   Stream<QuerySnapshot> get brews {
//     return brewCollection.snapshots();
//   }

  // get brews stream
  Stream<List<USER>> get utilisateurs {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }
}
