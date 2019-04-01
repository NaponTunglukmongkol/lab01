import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: email,
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                  if(value.isEmpty) return "Email is required";
                },
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(labelText: "Password"),
                validator: (value){
                  if(value.isEmpty) return "Password is required";
                },
                obscureText: true,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      child: Text("Signin"),
                      onPressed: () {
                        auth.signInWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                        ).then((FirebaseUser user){
                          if(user.isEmailVerified){
                            print("go to home screen");
                          }else{
                            print("Please verifyed your email");
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              FlatButton(
                child: Text("Register new user"),
                onPressed: () {
                  Navigator.pushNamed(context, "/register");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
