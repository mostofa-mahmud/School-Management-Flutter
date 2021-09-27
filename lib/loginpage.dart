import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_manage/admin_info.dart';
import 'package:student_manage/datastudent.dart';
import 'package:student_manage/register.dart';
import 'package:student_manage/student_list.dart';

class Loginpage extends StatefulWidget {
  //const Loginpage(bool who, {Key? key}) : super(key: key);
  bool? who;
  Loginpage(bool who){
    this.who=who;
  }

  @override
  _LoginpageState createState() => _LoginpageState(who!);
}

class _LoginpageState extends State<Loginpage> {
  bool? who;

  _LoginpageState(bool who){
    this.who=who;
  }

  String _email = "", _password = "";


  final GlobalKey<FormState> formkey = GlobalKey<FormState>();




  final FirebaseAuth _auth = FirebaseAuth.instance;

  late FirebaseUser user;

  Future<void> GetUser()async{
    FirebaseUser userEmail = await FirebaseAuth.instance.currentUser();
    setState(() {
      user = userEmail;
    });
  }
  @override
  void initState(){
    super.initState();
    GetUser();
  }



  Future<void> signIn() async {
    final formstate = formkey.currentState;
    if (formstate!.validate()) {
      formstate.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        if(who==false){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Datastudent()));
        }else{
          //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Teacher_Information()), (route) => false);
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Student_List()));
          if(user.email=='admin@yahoo.com'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Admin_Information()));
          }
        }
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Datastudent()));
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginPage"),
      ),
      body: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                  onSaved: (input) {
                    setState(() {
                      _email = input!;
                    });
                  },
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "Email field is empty !";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                  onSaved: (input) {
                    setState(() {
                      _password = input!;
                    });
                  },
                  validator: (input) {
                    if (input!.length < 4) {
                      return "Password is short !";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                color: Colors.teal,
                onPressed: () {
                  setState(() {
                    signIn();
                  });
                },
                child: Text("Login"),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                color: Colors.teal,
                onPressed: () {
                  setState(() {
                    Navigator.push(context,

                        MaterialPageRoute(builder: (context) => Register(who!)));
                  });
                },
                child: Text("Register"),
              )
            ],
          )),
    );
  }
}
