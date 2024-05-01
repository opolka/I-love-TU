class Subject {
  final String id;
  final String subjectname;
  final String section;
  final String teacher;
  final String studentID;
  final String day;
  final String start_time;
  final String end_time;
  final String day_exam;
  final String locatiom_exam;
  final String time_exam;
  final String room_exam;

  const Subject({
    required this.id,
    required this.subjectname,
    required this.section,
    required this.teacher,
    required this.day,
    required this.start_time,
    required this.end_time,
    required this.day_exam,
    required this.room_exam,
    required this.locatiom_exam,
    required this.time_exam,
    required this.studentID
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subjectname': subjectname,
      'section': section,
      'teacher': teacher,
      'day': day,
      'start_time': start_time,
      'end_time': end_time,
      'day_exam': day_exam,
      'time_exam': time_exam,
      'room_exam': room_exam,
      'location_exam': locatiom_exam,
      'student_id' : studentID
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['id'] ?? '',
      subjectname: map['subjectname'] ?? '',
      section: map['section'] ?? '',
      teacher: map['teacher'] ?? '',
      day: map['day'] ?? '',
      start_time: map['start_time'] ?? '',
      end_time: map['end_time'] ?? '',
      day_exam: map['day_exam'] ?? '',
      time_exam: map['time_exam'] ?? '',
      room_exam: map['room_exam'] ?? '',
      locatiom_exam: map['location_exam'] ?? '',
      studentID: map['student_id']?? '',
    );
  }
}
