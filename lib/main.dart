import 'package:firebase/firebase_options.dart';
import 'package:firebase/models/user.dart';
import 'package:firebase/screens/wrapper.dart';
import 'package:firebase/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<USER?>.value(
      value: AuthService().users,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
