import 'package:firebase/services/auth.dart';
import 'package:firebase/shared/constants.dart';
import 'package:firebase/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  String error = '';

// text field state
  String email = '';
  String password = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Sign in to Brew Crew'),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      //  InputDecoration(
                      //     hintText: 'Email',
                      //     fillColor: Colors.white,
                      //     filled: true,
                      //     enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //       color: Colors.black,
                      //       width: 2.0,
                      //     )),
                      //     focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: Colors.red, width: 2.0))),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                      validator: (val) => val!.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                        // color: Colors.pink[400],
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink[400]),
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => loading = true);
                            // print(email);
                            // print(password);
                            // register new account
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            //sign in to an existing account
                            // dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                // error = 'Please supply a valid email';
                                loading = false;
                                error =
                                    'could not sign in with those credentials';
                              });
                            }
                          }
                        }),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
