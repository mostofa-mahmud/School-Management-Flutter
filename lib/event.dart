import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Event extends StatefulWidget {
  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: StreamBuilder(
          stream: Firestore.instance.collection("admin_information").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
            if(!snapshot.hasData){
              return Text("No Value");
            }
            return ListView(
              children: snapshot.data!.documents.map((document){
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WavyAnimatedTextKit(
                        textStyle: TextStyle(
                          fontSize: 32,
                          fontFamily: "Popins",
                          fontWeight: FontWeight.w500,
                          //color: Colors.white
                        ),
                        text: [
                          "Event..."
                        ],
                      ),

                      SizedBox(height: 10,),

                      Container(
                        margin: EdgeInsets.all(20),
                        child: Table(
                            defaultColumnWidth: FixedColumnWidth(120.0),
                            border: TableBorder.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 2),
                            children:[
                              TableRow( children: [
                                Column(children:[Text('Event', style: TextStyle(fontSize: 20.0))]),
                                Column(children:[Text('Date', style: TextStyle(fontSize: 20.0))]),
                              ]),
                              TableRow( children: [
                                Column(children:[Text(document['Event'] ?? " ")]),
                                Column(children:[Text(document['Event_Date'] ?? " ")]),
                              ]),
                              TableRow( children: [
                                Column(children:[Text("--")]),
                                Column(children:[Text("--")]),
                              ]),
                            ]


                        ),

                      )



                      //Text(document['userEmail'] ?? " "),

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
