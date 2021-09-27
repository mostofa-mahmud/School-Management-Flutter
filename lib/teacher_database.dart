import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseserviceTeacher {

  String uid="";

  DatabaseserviceTeacher({required this.uid});

  final CollectionReference user = Firestore.instance.collection('teacher_information');
  //String _t_fname,_t_lname,_t_id,_time,_t_contact,_t_email;

  Future updateuserdata(String _t_fname,String _special,String _t_id,String _time, String _t_contact,String _day) async {
    return await user.document(uid).setData({
      'Name': _t_fname,
      'Special': _special,
      'Teacher_ID': _t_id,
      'Time': _time,
      'Contact': _t_contact,
      'Day': _day,
      //'Guardian_E-mail': _g_email,
      //'Class': _class
    }
    );
  }
}