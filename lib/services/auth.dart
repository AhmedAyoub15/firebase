import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // // create user obj based on firebase user
  USER? _userFromFirebaseUser(User? user) {
    return user != null ? USER(uid: user.uid) : null;
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

  // register with email and password

  // sign out
}