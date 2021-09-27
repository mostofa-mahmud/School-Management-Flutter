import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Routine extends StatefulWidget {
  @override
  _RoutineState createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {

  String _sub1="",_teacher1="",_sub2="",_teacher2="",_sub3="",_teacher3="";

  _fetch()async{
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if(firebaseUser!=null)
      await Firestore.instance.collection('student_information').document(firebaseUser.uid).get().then((ds){
        _sub1=ds.data['Subject_1'];
        _teacher1=ds.data['Teacher_1'];
        _sub2=ds.data['Subject_2'];
        _teacher2=ds.data["Teacher_2"];
        _sub3=ds.data["Subject_3"];
        _teacher3=ds.data["Teacher_3"];


      }).catchError((e){
        print(e);
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan,

        body: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.15,),
              WavyAnimatedTextKit(
                text: ["Class Routine..."],
                textStyle: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FutureBuilder(
                  future: _fetch(),
                  builder: (context,snapshot){
                    if(snapshot.connectionState!= ConnectionState.done)
                      return Text("No Data Available..",style: TextStyle(color: Colors.white),);
                    return DataTable(columns:[
                      DataColumn(label: Text("Day/Time",style: TextStyle(color: Colors.white),)),
                      DataColumn(label: Text("9-10 AM",style: TextStyle(color: Colors.white),)),
                      DataColumn(label: Text("10-11 AM",style: TextStyle(color: Colors.white),)),
                      DataColumn(label: Text("11AM-12PM",style: TextStyle(color: Colors.white),)),
                    ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text("SaturDay",style: TextStyle(color: Colors.white),)),
                            DataCell(Text("$_sub1\n$_teacher1",style: TextStyle(color: Colors.white),)),
                            DataCell(Text("$_sub2\n$_teacher2",style: TextStyle(color: Colors.white),)),
                            DataCell(Text("$_sub3\n$_teacher3",style: TextStyle(color: Colors.white),))
                          ]),
                          DataRow(cells: [
                            DataCell(Text("SundaDay",style: TextStyle(color: Colors.white),)),
                            DataCell(Text("$_sub3\n$_teacher3",style: TextStyle(color: Colors.white),)),
                            DataCell(Text("$_sub1\n$_teacher1",style: TextStyle(color: Colors.white),)),
                            DataCell(Text("$_sub2\n$_teacher2",style: TextStyle(color: Colors.white),))
                          ]),
                          DataRow(cells: [
                            DataCell(Text("MonDay",style: TextStyle(color: Colors.white),)),
                            DataCell(Text("$_sub2\n$_teacher2",style: TextStyle(color: Colors.white),)),
                            DataCell(Text("$_sub3\n$_teacher3",style: TextStyle(color: Colors.white),)),
                            DataCell(Text("$_sub1\n$_teacher1",style: TextStyle(color: Colors.white),))
                          ])
                        ]
                    );
                  },
                ),
              ),
            ],
          ),
        )


    );
  }
}