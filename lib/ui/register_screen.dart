import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Register new user")),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) return "Email is required";
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                validator: (value) {
                  if (value.isEmpty && value.length < 8)
                    return "Password is required";
                },
                obscureText: true,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Re Password"),
                validator: (value) {
                  if (value.isEmpty) return "Password is required";
                },
                obscureText: true,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      child: Text("Register"),
                      onPressed: () {
                        auth
                            .createUserWithEmailAndPassword(
                                email: "60070037@kmitl.ac.th", password: "123456789")
                            .then((FirebaseUser user) {
                              user.sendEmailVerification();
                              print("return from firebase ${user.email}");
                            });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
