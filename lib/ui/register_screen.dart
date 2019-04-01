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

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

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
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) return "Email is required";
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
                validator: (value) {
                  if (value.isEmpty && value.length < 8)
                    return "Password is required";
                },
                obscureText: true,
              ),
              TextFormField(
                controller: rePasswordController,
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
                        if (_formkey.currentState.validate()) {
                          auth
                              .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((FirebaseUser user) {
                            user.sendEmailVerification().then((user){
                              Navigator.pop(context);
                            });
                            print("return from firebase ${user.email}");
                          });
                        } else {
                          print("error");
                        }
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
