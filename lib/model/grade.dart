class Grade {
  final int id;
  final int term;
  final int year;
  final String teacher;
  final String subject;
  final String grade;

  const Grade(
      {required this.id,
      required this.term,
      required this.year,
      required this.teacher,
      required this.subject,
      required this.grade});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'term': term,
      'yaer': year,
      'teacher': teacher,
      'subject': subject,
      'grade': grade,
    };
  }

  factory Grade.fromMap(Map<String, dynamic> map) {
    return Grade(
      id: map['id'] ?? 0,
      term: map['term'] ?? 0,
      year: map['year'] ?? 0,
      teacher: map['teacher'] ?? '',
      subject: map['subject'] ?? '',
      grade: map['grade'] ?? '',
    );
  }
}
