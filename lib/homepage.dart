import 'package:flutter/material.dart';
import 'package:student_manage/loginpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);


  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   bool? who;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),

      body: Container(
        decoration: BoxDecoration(
          color: Colors.cyan,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [




                Image(
                    image: AssetImage('assets/images/student.png'),
                    width: 200,
                ),



                Card(
                  color: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Container(
                    height: 100,
                    width: 300,
                    child: Center(
                      child: FlatButton(
                          height: MediaQuery.of(context).size.height,
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: (){
                            who=true;

                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Loginpage(who!)));

                          },
                          child: Text("Login as Teacher")
                      ),
                    ),
                  ),
                ),



                SizedBox(height: 10,),
                Card(
                  color: Colors.teal,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Container(
                    height: 100,
                    width: 300,
                    child: Center(
                      child: FlatButton(
                          height: MediaQuery.of(context).size.height,
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: (){
                            who=false;

                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Loginpage(who!)));

                          },
                          child: Text("Login as Student")
                      ),
                    ),
                  ),
                )




              ],
            ),
          ),
        ),
      )
    );
  }
}
