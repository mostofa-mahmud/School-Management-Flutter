import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_manage/homepage.dart';
import 'package:student_manage/student_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Admin_Information extends StatefulWidget {
  @override
  _Student_InformationState createState() => _Student_InformationState();
}

class _Student_InformationState extends State<Admin_Information> {
  String _sub1 = "",
      _teacher1 = "",
      _sub2 = "",
      _teacher2 = "",
      _event = "",
      _event_date = "",
      _exam_date1 = "",
      _exam_date2 = "",
      _exam_time = "",
      _exam_venue = "";

  final CollectionReference brewcollection =
      Firestore.instance.collection('admin_information');
  String uid = "";

  Future<void> sendDataAdmin() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    await DatabaseserviceAdmin(uid: user.uid).updateuserdata(
      _sub1,
      _teacher1,
      _sub2,
      _teacher2,
      _event,
      _event_date,
      _exam_date1,
      _exam_date2,
      _exam_time,
      _exam_venue,
    );
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Homepage()));
  }

  //Firestore information = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  //color: Color(0xFF00ff11),
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Admin",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Admin Information",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Sbuject 1:"),
                    onChanged: (input) {
                      setState(() {
                        _sub1 = input;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Teacher 1:"),
                    onChanged: (input) {
                      setState(() {
                        _teacher1 = input;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Sbuject 2:"),
                    onChanged: (input) {
                      setState(() {
                        _sub2 = input;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: "Teacher 2:"),
                    onChanged: (input) {
                      setState(() {
                        _teacher2 = input;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: "Exam-1 Date:"),
                    onChanged: (input) {
                      setState(() {
                        _exam_date1 = input;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: "Exam-2 Date"),
                    onChanged: (input) {
                      setState(() {
                        _exam_date2 = input;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: "Exam Time:"),
                    onChanged: (input) {
                      setState(() {
                        _exam_time = input;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Exam venue:"),
                    onChanged: (input) {
                      setState(() {
                        _exam_venue = input;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Event:"),
                    onChanged: (input) {
                      setState(() {
                        _event = input;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Event Date:"),
                    onChanged: (input) {
                      setState(() {
                        _event_date = input;
                      });
                    },
                  ),
                ),
                FlatButton(
                    color: Colors.blueGrey,
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    onPressed: () {
                      sendDataAdmin();
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>Student_SignIn()));
                    },
                    child: Text("Save Information"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
