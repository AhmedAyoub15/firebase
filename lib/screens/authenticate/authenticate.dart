import 'package:firebase/screens/authenticate/register.dart';
import 'package:firebase/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Register()
        // SignIn()
        );
  }
}
