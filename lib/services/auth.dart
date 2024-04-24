import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // // create user obj based on firebase user
  // The role parameter is optional because it’s enclosed in square brackets []
  USER? _userFromFirebaseUser(User? user, [String? role]) {
    return user != null ? USER(uid: user.uid, role: role) : null;
  }

  Stream<USER?> get users {
    return _auth
        .authStateChanges()
        // .map((UserCredential user) => _userFromFirebaseUser(user))
        .map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  //this way we need to sign in with pre existing account
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      // Fetch the role of the user from Firestore
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('utilisateurs')
          .doc(user?.uid)
          .get();
      String? role = snapshot['role'];
      print("role in auth signin is : ${role}");

      return _userFromFirebaseUser(user, role);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password

  Future registerWithEmailAndPassword(
      String email, String password, String role) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      print(user!.uid);
      await DatabaseService(uid: user.uid).updateUserData(role, 'username');
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
