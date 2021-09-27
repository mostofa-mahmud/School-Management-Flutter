import 'package:flutter/material.dart';
import 'package:student_manage/teacher_database.dart';
import 'package:student_manage/loginpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Teacher_Information extends StatefulWidget {
  @override
  _Teacher_InformationState createState() => _Teacher_InformationState();
}

class _Teacher_InformationState extends State<Teacher_Information> {

  var genderchoose;
  List genderitem = ["Male", "Female", "Others"];

  var sectionchoose;
  List sectionitem = ["Science", "Commerce", "Arts", "Others"];

  String _t_fname="",_special="",_t_id="",_time="",_t_contact="",_day="";

  final CollectionReference brewcollection = Firestore.instance.collection('teacher_information');
  String uid="";

  Future<void> sendDataTeacher()async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    await DatabaseserviceTeacher(uid: user.uid).updateuserdata(_t_fname,_special,_t_id,_time,_t_contact,_day);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpage(true)));

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Image(image: AssetImage("assets/images/teacher_info.png"),
                //   height: MediaQuery.of(context).size.height*0.15,),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                Text(
                  "Create your account",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(hintText: "Name"),
                    onChanged: (input){
                      setState(() {
                        _t_fname=input;
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
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(hintText: "Speciality"),
                    onChanged: (input){
                      setState(() {
                        _special=input;
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
                    decoration: InputDecoration(hintText: "Teacher ID No."),
                    onChanged: (input){
                      setState(() {
                        _t_id=input;
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
                    decoration:
                    InputDecoration(hintText: "Cover Class Time"),
                    onChanged: (input){
                      setState(() {
                        _time=input;
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
                    decoration: InputDecoration(hintText: "Contact No."),
                    onChanged: (input){
                      setState(() {
                        _t_contact=input;
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
                    decoration: InputDecoration(hintText: "Cover Class Day"),
                    onChanged: (input){
                      setState(() {
                        _day=input;
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
                        dropdownColor: Colors.white,
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
                      padding: const EdgeInsets.only(left: 138),
                      child: DropdownButton(
                        dropdownColor: Colors.white,
                        hint: Text("Expertise"),
                        value: sectionchoose,
                        onChanged: (newValue) {
                          setState(() {
                            sectionchoose = newValue;
                          });
                        },
                        items: sectionitem.map((valueitem) {
                          return DropdownMenuItem(
                              value: valueitem,
                              child: Text(
                                valueitem,
                              ));
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                FlatButton(
                    color: Color(0xFF4d4d44),
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    onPressed: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>Teacher_SignIn()));
                      // setState(() {
                      //   information.collection('teacher_information').add(
                      //       {
                      //         'First_Name': _t_fname,
                      //         'Last_Name': _t_lname,
                      //         'Teacher_ID': _t_id,
                      //         'Address': _t_add,
                      //         'Contact': _t_contact,
                      //         'E-mail': _t_email,
                      //       }
                      //   );
                      // });
                      sendDataTeacher();
                    },
                    child: Text(
                      "Save Information",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}