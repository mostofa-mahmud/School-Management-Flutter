import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_manage/loginpage.dart';
import 'package:student_manage/student_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Student_Information extends StatefulWidget {
  @override
  _Student_InformationState createState() => _Student_InformationState();
}

class _Student_InformationState extends State<Student_Information> {
  var genderchoose;
  List genderitem = ["Male", "Female", "Others"];

  var sectionchoose;
  List sectionitem = ["A", "B", "C"];

  String _fname = "",
      _lname = "",
      _roll = "",
      _add = "",
      _g_name = "",
      _g_num = "",
      _g_email = "",
      _class = "";

  final CollectionReference brewcollection =
      Firestore.instance.collection('student_information');
  String uid = "";

  Future<void> sendDataStudent() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    await DatabaseserviceStudent(uid: user.uid).updateuserdata(
        _fname,
        _lname,
        _roll,
        _add,
        _g_name,
        _g_num,
        _g_email,
        _class,
        genderchoose,
        sectionchoose);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Loginpage(false)));
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
                  "Student Sign Up",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Student Account",
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
                    decoration: InputDecoration(hintText: "First Name"),
                    onChanged: (input) {
                      setState(() {
                        _fname = input;
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
                    decoration: InputDecoration(hintText: "Last Name"),
                    onChanged: (input) {
                      setState(() {
                        _lname = input;
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
                    decoration: InputDecoration(hintText: "Roll No."),
                    onChanged: (input) {
                      setState(() {
                        _roll = input;
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
                    decoration: InputDecoration(hintText: "Present Address"),
                    onChanged: (input) {
                      setState(() {
                        _add = input;
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
                    decoration: InputDecoration(hintText: "Guardian Name"),
                    onChanged: (input) {
                      setState(() {
                        _g_name = input;
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
                    decoration:
                        InputDecoration(hintText: "Guardian Contact No."),
                    onChanged: (input) {
                      setState(() {
                        _g_num = input;
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
                    decoration:
                        InputDecoration(hintText: "Guardian E-mail Address"),
                    onChanged: (input) {
                      setState(() {
                        _g_email = input;
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
                    decoration: InputDecoration(hintText: "Class"),
                    onChanged: (input) {
                      setState(() {
                        _class = input;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: DropdownButton(
                        hint: Text("Gender"),
                        value: genderchoose,
                        onChanged: (newValue) {
                          setState(() {
                            genderchoose = newValue;
                          });
                        },
                        items: genderitem.map((valueitem) {
                          return DropdownMenuItem(
                              value: valueitem, child: Text(valueitem));
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 160),
                      child: DropdownButton(
                        hint: Text("Section"),
                        value: sectionchoose,
                        onChanged: (newValue) {
                          setState(() {
                            sectionchoose = newValue;
                          });
                        },
                        items: sectionitem.map((valueitem) {
                          return DropdownMenuItem(
                              value: valueitem, child: Text(valueitem));
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                FlatButton(
                    color: Colors.blueGrey,
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    onPressed: () {
                      sendDataStudent();
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
