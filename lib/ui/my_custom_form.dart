import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom form"),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: <Widget>[
            Image.asset(
              "resources/Tulips.jpg",
              height: 100,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Please input your email",
                icon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => print(value),
              validator: (value){
                if(value.isEmpty){
                  return "Please input value";
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Please input password",
                icon: Icon(Icons.lock,)
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (value){
                if(value.isEmpty){
                  return "Please input value";
                }
              },
            ),
            RaisedButton(
              child: Text("Continue"),
              onPressed: () {
                _formkey.currentState.validate();
              },
            )
          ],
        ),
      ),
    );
  }
}
