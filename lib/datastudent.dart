import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_manage/event.dart';
import 'package:student_manage/exam.dart';
import 'package:student_manage/homepage.dart';
import 'package:student_manage/result.dart';
import 'package:student_manage/routine.dart';
import 'package:student_manage/teacher_list.dart';

class Datastudent extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Datastudent> {
  String fname = "",
      lname = "",
      clas = "",
      roll = "",
      add = "",
      gname = "",
      gnum = "",
      gmail = "";

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if (firebaseUser != null)
      await Firestore.instance
          .collection('student_information')
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        fname = ds.data['First_Name'];
        lname = ds.data['Last_Name'];
        clas = ds.data['Class'];
        roll = ds.data['Roll_No'];
        add = ds.data['Address'];
        gname = ds.data['Guardian'];
        gnum = ds.data['Guardian_Contact'];
        gmail = ds.data['Guardian_E-mail'];
        //print(fname);
      }).catchError((e) {
        print(e);
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.cyan,
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            elevation: 0,
            actions: [
              FlatButton(
                  onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                  },
                  child: Icon(Icons.logout)
              ),
            ],
          ),
          body: Column(
            children: [
              //SizedBox(height: MediaQuery.of(context).size.height*0.05,),




              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: FutureBuilder(
                  future: _fetch(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done)
                      return Text("No Data Available..");
                    return Column(
                      children: [
                        Text("Name: $fname $lname"),
                        Text("Class: $clas"),
                        Text("Roll No: $roll"),
                        Text("Address: $add"),
                        Text("Guardian Name: $gname"),
                        Text("Mobile No: $gnum"),
                        Text("E-Mail: $gmail")
                      ],
                    );
                    },
                ),
              ),

            // SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.green,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: FlatButton(
                      height: MediaQuery.of(context).size.height,
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Exam()));
                      },
                      child: Text(
                        "Exam Schedule",
                        style: TextStyle(fontSize: 18),
                      )
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.055,
                ),
              Card(
                color: Colors.blueGrey,
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: FlatButton(
                      height: MediaQuery.of(context).size.height,
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Event()));
                      },
                      child: Text(
                        "Event Schedule",
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              )
            ],
          ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Center(
              child: Card(
                color: Colors.lightGreenAccent,
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: FlatButton(
                    height: MediaQuery.of(context).size.height,
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Teacher_List()));
                    },
                    child: Text(
                      "Teacher Info",
                      style: TextStyle(fontSize: 20),
                    )
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.blueGrey,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: FlatButton(
                        height: MediaQuery.of(context).size.height,
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Result()));
                        },
                        child: Text(
                          "Result",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.055,
                ),
                Card(
                  color: Colors.green,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: FlatButton(
                        height: MediaQuery.of(context).size.height,
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Routine()));
                        },
                        child: Text(
                          "Class Routine",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}
