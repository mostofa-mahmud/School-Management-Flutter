import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}
class _ResultState extends State<Result> {
  String _math="",_phy="",_chem="",_fname="",_lname="",_class="",_roll="";

  _fetch()async{
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if(firebaseUser!=null)
      await Firestore.instance.collection('student_information').document(firebaseUser.uid).get().then((ds){
        _math=ds.data['Math'];
        _phy=ds.data['Physics'];
        _chem=ds.data['Chemistry'];
        _fname=ds.data["First_Name"];
        _lname=ds.data["Last_Name"];
        _class=ds.data["Class"];
        _roll=ds.data["Roll_No"];

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
              textStyle: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Popins"
              ),
              text: ["Student Result..."],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.2,),
            FutureBuilder(
              future: _fetch(),
              builder: (context,snapshot){
                if(snapshot.connectionState!= ConnectionState.done)
                  return Text("No Data Available..");
                return Column(
                  children: [
                    Text("Name: $_fname $_lname"),
                    Text("Class: $_class"),
                    Text("Roll: $_roll"),
                    DataTable(columns:[
                      DataColumn(label: Text("Mathematics")),
                      DataColumn(label: Text("Physics")),
                      DataColumn(label: Text("Chemistry")),
                    ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text("$_math")),
                            DataCell(Text("$_phy")),
                            DataCell(Text("$_chem"))
                          ])
                        ]
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
