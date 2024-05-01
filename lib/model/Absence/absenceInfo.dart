
import 'package:i_love_tu/model/informations.dart';

class UserAbsence{
  final int? id;
  final String title;
  final String thaiName;
  final String engName;
  final String dateOfBirth;
  final String faculty;
  final String major;
  final String years;
  final String academicyear;
  final String idCard;
  final String studentcard;
  final String absence;
  final String dateStart;
  final String dateEnd;

  const UserAbsence({
    this.id,
    required this.title,
    required this.thaiName,
    required this.engName,
    required this.dateOfBirth,
    required this.faculty,
    required this.major,
    required this.years,
    required this.academicyear,
    required this.idCard,
    required this.studentcard,
    required this.absence,
    required this.dateStart,
    required this.dateEnd,
  }
);

  UserAbsence copy({
    int? id,
    String? title,
    String? thaiName,
    String? engName,
    String? dateOfBirth,
    String? faculty,
    String? major,
    String? years,
    String? academicyear,
    String? idCard,
    String? studentcard,
    String? absence,
    String? dateStart,
    String? dateEnd,
    
  }) =>
  UserAbsence(
    id: id ?? this.id,
    title: title ?? this.title,
    thaiName: thaiName ?? this.thaiName,
    engName: engName ?? this.engName,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    faculty: faculty ?? this.faculty,
    major: major ?? this.major,
    years: years ?? this.years,
    academicyear: academicyear ?? this.academicyear,
    idCard: idCard ?? this.idCard,
    studentcard: studentcard ?? this.studentcard,
    absence: absence ?? this.absence,
    dateStart: dateStart ?? this.dateStart,
    dateEnd: dateEnd ?? this.dateEnd,

    );
    

  Map<String, dynamic> toJson() => {
    UserFields.id: id,
    UserFields.title: title,
    UserFields.thaiName: thaiName,
    UserFields.engName: engName,
    UserFields.dateOfBirth: dateOfBirth,
    UserFields.faculty: faculty,
    UserFields.major: major,
    UserFields.years: years,
    UserFields.academicyear: academicyear,
    UserFields.idCard: idCard,
    UserFields.studentcard: studentcard,
    UserFields.absence: absence,
    UserFields.dateStart: dateStart,
    UserFields.dateEnd: dateEnd,
  };
}