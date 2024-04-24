import 'package:firebase/models/user.dart';
import 'package:firebase/screens/authenticate/authenticate.dart';
import 'package:firebase/services/routing.dart';
import 'package:firebase/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<USER?>(context);
    if (user == null) {
      return Authenticate();
    } else {
      routeToPageBasedOnRole(context);
      return Loading(); // Show loading screen while routing
    }
  }
}
