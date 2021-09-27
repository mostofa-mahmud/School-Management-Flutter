import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Student_List extends StatefulWidget {
  @override
  _Student_ListState createState() => _Student_ListState();
}
class _Student_ListState extends State<Student_List> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0b1638),
      appBar: AppBar(
          backgroundColor: Color(0xFF0b1638),
          elevation: 0,
          title: Text("Student List.."),
          // title: Center(
          //   child: WavyAnimatedTextKit(
          //     text: ["Students List..."],
          //     textStyle: TextStyle(
          //       //color: Colors.white
          //         fontSize: 25,
          //         fontFamily: "Popins",
          //         fontWeight: FontWeight.w400
          //     ),
          //   ),
          // )
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection("student_information").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
            if(!snapshot.hasData){
              return Text("No value",style: TextStyle(color: Colors.white),);
            }
            return ListView(
              children: snapshot.data!.documents.map((document){
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      //SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      Text("\t Student Name: "+document['First_Name'] ?? "No Data Available",style: TextStyle(color: Colors.white)),
                      Text("\t Class: "+document['Class'] ?? "No Data Available",style: TextStyle(color: Colors.white),),
                      Text("\t Roll: "+document['Roll_No'] ?? "No Data Available",style: TextStyle(color: Colors.white),)
                    ],
                  ),
                );
              }).toList(),
            );
          }
      ),

    );
  }
}