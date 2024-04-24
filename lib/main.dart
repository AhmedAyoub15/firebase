import 'package:firebase/firebase_options.dart';
import 'package:firebase/models/user.dart';
import 'package:firebase/screens/home/admin.dart';
import 'package:firebase/screens/home/home.dart';
import 'package:firebase/screens/home/medcin.dart';
import 'package:firebase/screens/home/para_medical.dart';
import 'package:firebase/screens/home/patient.dart';
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
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(),
          '/home': (context) => Home(),
          '/admin': (context) => AdminPage(),
          '/medcin': (context) => MedcinPage(),
          '/paraMedical': (context) => ParaMedicalPage(),
          '/patient': (context) => PatientPage(),
        },
      ),
    );
  }
}
