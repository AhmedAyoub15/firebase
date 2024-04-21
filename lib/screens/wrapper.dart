import 'package:firebase/models/user.dart';
import 'package:firebase/screens/authenticate/authenticate.dart';
// import 'package:firebase/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<USER?>(context);
    print(user);
    // return either the Home or Authenticate widget
    return Authenticate();
  }
}
