class Teacher_data {
  final String teacherDepartment;
  final String teacherTel;
  final String teacherLine;
  final String teacherEmail;
  final String teacherOffice;
  // final String imageURL;

  const Teacher_data({
    required this.teacherLine,
    required this.teacherDepartment,
    required this.teacherEmail,
    required this.teacherOffice,
    required this.teacherTel,
    // required this.imageURL,
  });

  Map<String, dynamic> toMap() {
    return {
      'department': teacherDepartment,
      'tel': teacherTel,
      'line': teacherLine,
      'email': teacherEmail,
      'office': teacherOffice,
      // 'image_url': imageURL,
    };
  }

  factory Teacher_data.fromMap(Map<String, dynamic> map) {
    return Teacher_data(
      teacherDepartment: map['department'] ?? '',
      teacherEmail: map['email'] ?? '',
      teacherLine: map['line'] ?? '',
      teacherOffice: map['office'] ?? '',
      teacherTel: map['tel'] ?? '',
      //  imageURL: map['image_url']?? '',
    );
  }
}
