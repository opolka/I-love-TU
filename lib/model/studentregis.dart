class StudentRegis {
  final String subjectID;
  final String subject;
  final String teacher;
  final String section;
  final int amount;
  final String studentID;
  final String grade;
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
    final String imageURL;

  const StudentRegis(
      {required this.subject,
      required this.teacher,
      required this.section,
      required this.amount,
      required this.studentID,
      required this.grade,
      required this.subjectID,
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
      required this.imageURL,
      });

  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'teacher': teacher,
      'section': section,
      'amount': amount,
      'student_id': studentID,
      'grade': grade,
      'subject_id': subjectID,
      'day': day,
      'start_time': start_time,
      'end_time': end_time,
      'day_exam': day_exam,
      'time_exam': time_exam,
      'room_exam': room_exam,
      'location_exam': location_exam,
      'study_hour': study_hour,
      'teacher_department': teacherDepartment,
      'teacher_tel': teacherTel,
      'teacher_line': teacherLine,
      'teacher_email': teacherEmail,
      'teacher_office': teacherOffice,
      'image_url': imageURL,
      
    };
  }

  Map<String, dynamic> toMapDB() {
    return {
      'subject': subject,
      'teacher': teacher,
      'section': section,
      'amount': amount,
      'student_id': studentID,
      'grade': grade,
      'subject_id': subjectID,
      // 'image_url': imageURL,
    };
  }

  factory StudentRegis.fromMap(Map<String, dynamic> map) {
    return StudentRegis(
      section: map['section'] ?? '',
      teacher: map['teacher'] ?? '',
      subject: map['subject'] ?? '',
      amount: map['amount'] ?? 0,
      studentID: map['student_id'] ?? '',
      grade: map['grade'] ?? '',
      subjectID: map['subject_id'] ?? '',
      day: map['day'] ?? '',
      start_time: map['start_time'] ?? '',
      end_time: map['end_time'] ?? '',
      day_exam: map['day_exam'] ?? '',
      time_exam: map['time_exam'] ?? '',
      room_exam: map['room_exam'] ?? '',
      location_exam: map['location_exam'] ?? '',
      study_hour: map['study_hour'] ?? 0,
      teacherDepartment: map['teacher_department'] ?? '',
      teacherEmail: map['teacher_email'] ?? '',
      teacherLine: map['teacher_line'] ?? '',
      teacherOffice: map['teacher_office'] ?? '',
      teacherTel:  map['teacher_tel'] ?? '',
      imageURL: map['image_url']?? '',
      
    );
  }
}
