class UserFields{
  static const String id = 'id';
  static const String title = 'คำนำหน้า';
  static const String thaiName = 'ชื่อภาษาไทย';
  static const String engName = 'ชื่อภาษาอังกฤษ';
  static const String dateOfBirth = 'วัน/เดือน/ปีเกิด';
  static const String faculty = 'คณะ';
  static const String major = 'สาขา';
  static const String nationality = 'สัญชาติ';
  static const String gender = 'เพศ';
  static const String dateOfIssue = 'วันออกบัตร';
  static const String dateOfExpiry = 'วันบัตรหมดอายุ';
  static const String years = 'ชั้นปี';
  static const String academicyear = 'ปีการศึกษา';
  static const String idCard = 'เลขบัตรประชาชน';
  static const String studentcard = 'เลขบัตรนักศึกษา';
  static const String absence = 'เหตุผลลาออก';
  static const String dateStart = 'วันที่เริ่มลาพัก';
  static const String dateEnd = 'วันสุดท้ายที่ลาพัก';
  static const String evidence = 'หลักฐานการศึกษา';
  static const String list = 'รายการจดทะเบียนล่าช้า';
  static const String number = 'รหัสวิชา';
  static const String section = 'section';

  static List<String> getFieldsNewCard() => [
    id,
    title,
    thaiName,
    engName,
    dateOfBirth,
    faculty,
    major,
    nationality,
    gender,
    dateOfIssue,
    dateOfExpiry,
    ];

    static List<String> getFieldslostCard() => [
    id,
    title,
    thaiName,
    engName,
    dateOfBirth,
    faculty,
    major,
    nationality,
    gender,
    dateOfIssue,
    dateOfExpiry,
    
    ];

    static List<String> getFieldsResign() => [
    id,
    title,
    thaiName,
    engName,
    dateOfBirth,
    faculty,
    major,
    years,
    academicyear,
    idCard,
    studentcard,
    absence
    ];

    static List<String> getFieldsAbsence() => [
    id,
    title,
    thaiName,
    engName,
    dateOfBirth,
    faculty,
    major,
    years,
    academicyear,
    idCard,
    studentcard,
    absence,

    ];

    static List<String> getFieldsEvidence() => [
    id,
    title,
    thaiName,
    engName,
    dateOfBirth,
    faculty,
    major,
    years,
    academicyear,
    idCard,
    studentcard,
    evidence

    ];
    
    static List<String> getFieldsRegister() => [
    id,
    title,
    thaiName,
    engName,
    dateOfBirth,
    faculty,
    major,
    years,
    academicyear,
    idCard,
    studentcard,
    list,
    number,
    list

    ];

}