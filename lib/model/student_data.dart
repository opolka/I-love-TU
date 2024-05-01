class Students {
  final String studentID;
  final String firstName;
  final String lastName;
  final String idNumber;
  final String email;
  final String dateOfBirth;
  final String gender;
  final String imageURL;
  final String faculty;
  final String major;
  final int studyYear;
  final String grade;
  final int credit;
  final String other;

  Students({
    required this.studentID,
    required this.firstName,
    required this.lastName,
    required this.idNumber,
    required this.email,
    required this.dateOfBirth,
    required this.gender,
    required this.imageURL,
    required this.faculty,
    required this.major,
    required this.studyYear,
    required this.grade,
    required this.credit,
    required this.other
  });

  factory Students.fromMap(Map<String, dynamic> map) {
    return Students(
      studentID: map['student_id']?? '',
      firstName: map['first_name']?? '',
      lastName: map['last_name']?? '',
      idNumber: map['id_number']?? '',
      email: map['email']?? '',
      dateOfBirth: map['date_of_birth']?? '',
      gender: map['gender']?? '',
      imageURL: map['image_url']?? '',
      faculty: map['faculty']?? '',
      major: map['major']?? '',
      studyYear: map['study_year']?? 0,
      grade: map['grade']?? '',
      credit: map['credit']?? 0,
      other: map['other_details']?? ''
    );
  
  }

}