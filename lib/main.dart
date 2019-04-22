import 'package:flutter/material.dart';
import './bloc/counter_bloc.dart';
import './bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  final CounterBloc _counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: BlocProvider(
        bloc: _counterBloc,
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    CounterBloc _bloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Counter'),
        actions: <Widget>[IconButton(
          icon: Icon(Icons.remove_circle),
          onPressed: () {
            _bloc.dispatch(CounterEvent.decrease);
          })],
      ),
      body: BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, int state) {
          return Center(
            child: Text('$state'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _bloc.dispatch(CounterEvent.increase);
        },
      ),
    );
  }
}