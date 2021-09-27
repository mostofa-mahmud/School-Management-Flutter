import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Teacher_List extends StatefulWidget {
  @override
  _Teacher_ListState createState() => _Teacher_ListState();
}

class _Teacher_ListState extends State<Teacher_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        title: Center(
          child: WavyAnimatedTextKit(
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: 32
            ),
            text: ["Teachers List..."],
            isRepeatingAnimation: false,
          ),
        ),
      ),
      body: StreamBuilder(
          stream:
          Firestore.instance.collection("teacher_information").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Text("No value");
            }
            return ListView(
              children: snapshot.data!.documents.map((document) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      //SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      Text("Teacher Name: " + document['Name'] ??
                          "No Data Available"),
                      Text("Teacher ID: " + document['Teacher_ID'] ??
                          "No Data Available"),
                      Text("Speciality: " + document['Special'] ??
                          "No Data Available"),
                      Text("Contact No: " + document['Contact'] ??
                          "No Data Available"),
                      Text("Cover Class: " +
                          document['Day'] +
                          " at " +
                          document['Time'] ??
                          "No Data Available"),
                      //Text("Free T: "+document['Time'] ?? "No Data Available"),
                      //SizedBox(height: MediaQuery.of(context).size.height*0.01,)
                    ],
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
