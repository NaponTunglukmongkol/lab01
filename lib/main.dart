import 'package:flutter/material.dart';
import './ui/detail_screen.dart';
import './ui/first_screen.dart';
import './ui/second_screen.dart';
import './ui/my_custom_form.dart';
import './ui/list_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{ //Change screen
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(),
      initialRoute: '/second',
      routes: {
        "/": (context) => MyCustomForm(),
        "/second": (context) => SecondScreen(),
        "/detail": (context) => DetailScreen(),
        "/first": (context) => FirstScreen(),
        "/listdata": (context) => ListData()
      },
    );
  }

}
/*class MyHomePage extends StatelessWidget{ //navbar
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tabbar"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.android),
                text: "Android",
              ),
              Tab(
                icon: Icon(Icons.camera),
                text: "Carmera",
              ),
              Tab(
                icon: Icon(Icons.alarm),
                text: "alarm",
              ),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          Icon(Icons.airplay),
          Icon(Icons.airplanemode_active),
          Icon(Icons.bookmark),
        ],),
      ),
    );
  }
}*/
/*class MyHomePage extends StatefulWidget { //Column
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello world test ...."),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("${counter}"),
          Text("value 2"),
          Text("value 3"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
          print("counter calue $counter");
        },
      ),
    );
  }
}*/

/* class MyHomePage extends StatelessWidget {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello world test ...."),
      ),
      body: Text("${counter}"),
      floatingActionButton: RaisedButton(
        child: Icon(Icons.add),
        onPressed: () {
          counter++;
          print("counter calue $counter");
        },
      ),
    );
  }
}
*/
