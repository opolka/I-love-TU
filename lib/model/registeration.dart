class Registeration {
  final String id;
  final String subjectname;
  final String section;
  final String teacher;
  final int seatavai;
  final int totalseat;
  final int amount;
  final String day;
  final String start_time;
  final String end_time;
  final String day_exam;
  final String location_exam;
  final String time_exam;
  final String room_exam;
  final int study_hour;
  final String teacherDepartment;
  final String teacherTel;
  final String teacherLine;
  final String teacherEmail;
  final String teacherOffice;
  // final String imageURL;
  

  const Registeration(
      {required this.id,
      required this.subjectname,
      required this.section,
      required this.teacher,
      required this.seatavai,
      required this.amount,
      required this.totalseat,
      required this.day,
      required this.start_time,
      required this.end_time,
      required this.day_exam,
      required this.room_exam,
      required this.location_exam,
      required this.time_exam,
      required this.study_hour,
      required this.teacherLine,
    required this.teacherDepartment,
    required this.teacherEmail,
    required this.teacherOffice,
    required this.teacherTel,
    // required this.imageURL,
      
      });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subjectname': subjectname,
      'section': section,
      'teacher': teacher,
      'seatavai': seatavai,
      'totalseat': totalseat,
      'amount': amount,
      'day': day,
      'start_time': start_time,
      'end_time': end_time,
      'day_exam': day_exam,
      'room_exam': room_exam,
      'location_exam': location_exam,
      'study_hour': study_hour,
      'teacher_department': teacherDepartment,
      'teacher_tel': teacherTel,
      'teacher_line': teacherLine,
      'teacher_email': teacherEmail,
      'teacher_office': teacherOffice,
      // 'image_url': imageURL,
    };
  }

  factory Registeration.fromMap(Map<String, dynamic> map) {
    return Registeration(
      id: map['id'] ?? '',
      subjectname: map['subjectname'] ?? '',
      section: map['section'] ?? '',
      teacher: map['teacher'] ?? '',
      seatavai: map['seatavai'] ?? 0,
      totalseat: map['totalseat'] ?? 0,
      amount: map['amount'] ?? 0,
      day: map['day'] ?? '',
      start_time: map['start_time'] ?? '',
      end_time: map['end_time'] ?? '',
      day_exam: map['day_exam'] ?? '',
      room_exam: map['room_exam'] ?? '',
      location_exam: map['location_exam'] ?? '',
      time_exam: map['time_exam'] ?? '',
      study_hour: map['study_hour'] ?? 0,
      teacherDepartment: map['teacher_department'] ?? '',
      teacherEmail: map['teacher_email'] ?? '',
      teacherLine: map['teacher_line'] ?? '',
      teacherOffice: map['teacher_office'] ?? '',
      teacherTel:  map['teacher_tel'] ?? '',
      //  imageURL: map['image_url']?? '',
    );
  }
}
