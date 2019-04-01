import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder(stream: Firestore.instance.collection('books').snapshots(),
    builder: (context, snapshort){
      if(snapshort.hasData){
        return ListView.builder(
          itemCount: snapshort.data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: snapshort.data[index]['title'],
              subtitle: snapshort.data[index]['author']
            );
          },
        );
      }else{
        return CircularProgressIndicator();
      }
    },);
  }  
}