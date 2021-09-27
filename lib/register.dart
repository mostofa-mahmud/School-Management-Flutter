
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_manage/student_info.dart';
import 'package:student_manage/teacher_info.dart';

class Register extends StatefulWidget {
  //const Register({Key? key}) : super(key: key);
  bool? who;
  Register(bool who){
    this.who=who;
  }

  @override
  _RegisterState createState() => _RegisterState(who!);
}

class _RegisterState extends State<Register> {

  bool? who;
  _RegisterState(bool who){
    this.who=who;
  }

  String _remail="";
  String _rpassword="";

  final GlobalKey<FormState> _rformkey = GlobalKey<FormState>();


  Future<void>register()async{
    final formstate = _rformkey.currentState;
    if(formstate!.validate()){
      formstate.save();
      try{

        FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _remail, password: _rpassword);

        if(who==false){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Student_Information()));
        }else{
          //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Teacher_Information()), (route) => false);
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Teacher_Information()));
        }

      }
      catch(e){
        print(e);

      }

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),

      body: Form(
        key: _rformkey,
        child: Column(
          children: [



            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Email"
                ),
                onSaved: (input){
                  setState(() {
                    _remail=input!;
                  });
                },
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Password"
                ),
                onSaved: (input){
                  setState(() {
                    _rpassword=input!;
                  });
                },
              ),
            ),


            SizedBox(height: 10,),
            FlatButton(
                color: Colors.teal,
                onPressed: (){
                  setState(() {
                    register();
                  });
                },
                child: Text("Register")
            )




          ],
        ),
      ),
    );
  }
}
