import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/models/brew.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brew');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data);

      return Brew(
        name: doc['name'],
        strength: doc['strength'],
        sugars: doc['sugars'],
      );
    }).toList();
  }

  //setup a stream to listen to any change in the database
//   Stream<QuerySnapshot> get brews {
//     return brewCollection.snapshots();
//   }

  // get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
