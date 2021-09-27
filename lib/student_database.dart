import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseserviceStudent {
  String uid;

  DatabaseserviceStudent({required this.uid});

  final CollectionReference user =
      Firestore.instance.collection('student_information');

  Future updateuserdata(
      String _fname,
      String _lname,
      String _roll,
      String _add,
      String _g_name,
      String _g_num,
      String _g_email,
      String _class,
      genderchoose,
      sectionchoose) async {
    return await user.document(uid).setData({
      'First_Name': _fname,
      'Last_Name': _lname,
      'Roll_No': _roll,
      'Address': _add,
      'Guardian': _g_name,
      'Guardian_Contact': _g_num,
      'Guardian_E-mail': _g_email,
      'Class': _class,
      'Gender': genderchoose,
      'Section': sectionchoose,
    });
  }
}

class DatabaseserviceAdmin {
  String uid;

  DatabaseserviceAdmin({required this.uid});

  final CollectionReference user =
  Firestore.instance.collection('admin_information');

  Future updateuserdata(
      String _sub1,
      String _teacher1,
      String _sub2,
      String _teacher2,
      String _event,
      String _event_date,
      String _exam_date1,
      String _exam_date2,
      String _exam_time,
      String _exam_venue
      ) async {
    return await user.document(uid).setData({
      'Subject_1': _sub1,
      'Teacher_1': _teacher1,
      'Subject_2': _sub2,
      'Teacher_2': _teacher2,
      'Event': _event,
      'Event_Date': _event_date,
      'Exam_Date_1': _exam_date1,
      'Exam_Date_2': _exam_date2,
      'Exam_Time': _exam_time,
      'Exam_Venue': _exam_venue,
    });
  }
}
