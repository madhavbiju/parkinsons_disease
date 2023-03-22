import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

class ReadData extends StatefulWidget {
  @override
  _ReadDataState createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  String ?p1;
  String ?p2;
  String ?sum;
  final databaseReference = FirebaseDatabase.instance.ref();

@override
void initState() {
  super.initState();
  setupDatabaseListeners();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        centerTitle: true, 
        title: Text('Parkinsons Disease'),
      ),
      body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "P1",
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "P1",
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "P1",
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "P2",
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Sum="+
              sum!,
            ),
          ),
        ],
      ),
    ],
  ),
),

      );
  }
            
void setupDatabaseListeners() {
  databaseReference.child('SmartParking').child('P1').onValue.listen((event) {
    setState(() {
      p1 = event.snapshot.value.toString();
      print(p1);
    });
  });
  databaseReference.child('SmartParking').child('P2').onValue.listen((event) {
    setState(() {
      p2 = event.snapshot.value.toString();
    });
  });
  databaseReference.child('SmartParking').child('sum').onValue.listen((event) {
    setState(() {
      sum = event.snapshot.value.toString();
    });
  });
}


}