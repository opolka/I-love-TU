

import 'package:i_love_tu/model/informations.dart';

class UserCardLost{
  final int? id;
  final String title;
  final String thaiName;
  final String engName;
  final String dateOfBirth;
  final String faculty;
  final String major;
  final String nationality;
  final String gender;
  final String dateOfIssue;
  final String dateOfExpiry;


  const UserCardLost({
    this.id,
    required this.title,
    required this.thaiName,
    required this.engName,
    required this.dateOfBirth,
    required this.faculty,
    required this.major,
    required this.nationality,
    required this.gender,
    required this.dateOfIssue,
    required this.dateOfExpiry,

  }
);

  UserCardLost copy({
    int? id,
    String? title,
    String? thaiName,
    String? engName,
    String? dateOfBirth,
    String? faculty,
    String? major,
    String? nationality,
    String? gender,
    String? dateOfIssue,
    String? dateOfExpiry,

    
  }) =>
  UserCardLost(
    id: id ?? this.id,
    title: title ?? this.title,
    thaiName: thaiName ?? this.thaiName,
    engName: engName ?? this.engName,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    faculty: faculty ?? this.faculty,
    major: major ?? this.major,
    nationality: nationality ?? this.nationality,
    gender: gender ?? this.gender,
    dateOfIssue: dateOfIssue ?? this.dateOfIssue,
    dateOfExpiry: dateOfExpiry ?? this.dateOfExpiry,

    );
    

  Map<String, dynamic> toJson() => {
    UserFields.id: id,
    UserFields.title: title,
    UserFields.thaiName: thaiName,
    UserFields.engName: engName,
    UserFields.dateOfBirth: dateOfBirth,
    UserFields.faculty: faculty,
    UserFields.major: major,
    UserFields.nationality: nationality,
    UserFields.gender: gender,
    UserFields.dateOfIssue: dateOfIssue,
    UserFields.dateOfExpiry: dateOfExpiry,

  };
}