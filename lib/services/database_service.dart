import 'package:i_love_tu/global.dart';
import 'package:i_love_tu/model/grade.dart';
import 'package:i_love_tu/model/registeration.dart';
import 'package:i_love_tu/model/subject.dart';
import 'package:i_love_tu/model/studentregis.dart';
import 'package:i_love_tu/model/teacher.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:developer';
import 'package:i_love_tu/model/busline.dart';
import 'package:i_love_tu/model/news.dart';
import 'package:i_love_tu/model/booking.dart';
import 'package:i_love_tu/model/krom_luang.dart';
import 'package:i_love_tu/model/puey.dart';
import 'package:i_love_tu/model/announcement.dart';

class DatabaseService {
  // Singleton pattern
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    //databaseFactory = databaseFactoryFfi;
    //final databasePath = await getDatabasesPath();'
    //Directory directory = await getApplicationDocumentsDirectory();

    String databasePath = "/Users/pornlavin";
    //directory.path;
    log("data:$databasePath");

    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    final path = join(databasePath, 'tuapp.db');
    log("data:$path");

    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
    );
  }

  // When the database is first created, create a table to store breeds
  // and a table to store dogs.
  Future<void> _onCreate(Database db, int version) async {
    // Run the CREATE {breeds} TABLE statement on the database.

    // Run the CREATE {dogs} TABLE statement on the database.
    // await db.execute(
    //   'CREATE TABLE subjects(id TEXT PRIMARY KEY,subjectname  TEXT, section TEXT,teacher TEXT,day TEXT,start_time TEXT,end_time TEXT)',
    // );
  }

  // Define a function that inserts breeds into the database
  Future<void> insertSubject(Subject subject) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Insert the Breed into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same breed is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'subjects',
      subject.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertGrade(Grade grade) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Insert the Breed into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same breed is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'grade',
      grade.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertRegisteration(StudentRegis studentRegis) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Insert the Breed into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same breed is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'std_regis',
      studentRegis.toMapDB(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    String subject = studentRegis.subjectID;

    String sql =
        "UPDATE registeration SET seatavai=seatavai-1 WHERE id='$subject'";
    log(sql);
    await db.rawUpdate(sql);
  }

  Future<List<Grade>> grades() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query("grade");
    log("gradelength:$maps.length");
    return List.generate(maps.length, (index) => Grade.fromMap(maps[index]));
  }

  Future<List<Subject>> subjects() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query("subjects");
    log("subjectlength:$maps.length");
    return List.generate(maps.length, (index) => Subject.fromMap(maps[index]));
  }

  Future<List<Registeration>> registeration() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query("registeration");
    log("subjectlength:$maps.length");
    return List.generate(
        maps.length, (index) => Registeration.fromMap(maps[index]));
  }

  Future<List<Map<String, dynamic>>> getRegisterData(
      String subjectID, String section) async {
    final db = await _databaseService.database;

    final maps = await db.rawQuery(
      "SELECT * FROM registeration WHERE id = '$subjectID' AND section = '$section'",
    );
    if (maps.isNotEmpty) {
      return maps;
    } else {
      throw Exception(' data not found for subjectid: $subjectID');
    }
  }

  Future<List<Map<String, dynamic>>> getMyRegis(String studentID) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'std_regis',
      where: 'student_id = ?',
      whereArgs: [studentID],
    );
    if (maps.isNotEmpty) {
      return maps;
    } else {
      throw Exception(' data not found for subjectid: $studentID');
    }
  }

  Future<List<Map<String, dynamic>>> getMySubject(String studentID) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'subjects',
      where: 'student_id = ?',
      whereArgs: [studentID],
    );
    if (maps.isNotEmpty) {
      return maps;
    } else {
      throw Exception(' data not found for subjectid: $studentID');
    }
  }

  Future<List<StudentRegis>> std_registeration(String studentID) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'std_regis',
      where: 'student_id = ?',
      whereArgs: [studentID],
    );
    log("check regis count");

    if (maps.isNotEmpty) {
      log("stdregistlenth:$maps.length");
      return List.generate(
          maps.length, (index) => StudentRegis.fromMap(maps[index]));
    } else {
      log("stdregistlenth: error not found");
      throw Exception(' data not found for Student id: $studentID');
    }
  }

  Future<List<Subject>> std_subject(String studentID) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'subjects',
      where: 'student_id = ?',
      whereArgs: [studentID],
    );
    log("check regis count");

    if (maps.isNotEmpty) {
      log("stdregistlenth:$maps.length");
      return List.generate(
          maps.length, (index) => Subject.fromMap(maps[index]));
    } else {
      log("stdregistlenth: error not found");
      throw Exception(' data not found for Student id: $studentID');
    }
  }

  Future<List<Registeration>> registerationList() async {
    return List.generate(subjectAddList.length,
        (index) => Registeration.fromMap(subjectAddList[index]));
  }

  Future<Map<String, dynamic>> getUserDatass(String studentID) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'students',
      where: 'student_id = ?',
      whereArgs: [studentID],
    );
    if (maps.isNotEmpty) {
      return maps.first;
    } else {
      throw Exception('User data not found for studentID: $studentID');
    }
  }

  Future<bool> login(String studentID, String idNumber) async {
    final db = await _databaseService.database;
    final result = await db.rawQuery(
      "SELECT * FROM students WHERE student_id = '$studentID' AND id_number = '$idNumber'",
    );
    return result.isNotEmpty;
  }

  Future<List<StudentRegis>> getMyRegistDetail(String studentID) async {
    final db = await _databaseService.database;
    final maps = await db.rawQuery(
        "SELECT std_regis.*,registeration.day,registeration.start_time,registeration.end_time,registeration.day_exam,registeration.location_exam,registeration.time_exam,registeration.room_exam,registeration.study_hour,registeration.teacher_department,registeration.teacher_tel,registeration.teacher_line,registeration.teacher_email,registeration.teacher_office,registeration.image_url from std_regis INNER JOIN registeration ON std_regis.subject_id=registeration.id  AND std_regis.section=registeration.section WHERE std_regis.student_id = '$studentID' ");

    final studentRegisList = List.generate(
        maps.length, (index) => StudentRegis.fromMap(maps[index]));

    return studentRegisList;
  }

  Future<List<Map<String, dynamic>>> getMyRegistDetailDynamic(
      String studentID) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT std_regis.*,registeration.day,registeration.start_time,registeration.end_time,registeration.day_exam,registeration.location_exam,registeration.time_exam,registeration.room_exam,registeration.study_hour,registeration.teacher_department,registeration.teacher_tel,registeration.teacher_line,registeration.teacher_email,registeration.teacher_office,registeration.image_url from std_regis INNER JOIN registeration ON std_regis.subject_id=registeration.id  AND std_regis.section=registeration.section WHERE std_regis.student_id = '$studentID' ");

    return maps;
  }

  Future<List<Teacher_data>> getTeacher() async {
    final db = await _databaseService.database;
    final maps = await db.rawQuery("SELECT * from teacher");

    final teacherData = List.generate(
        maps.length, (index) => Teacher_data.fromMap(maps[index]));

    return teacherData;
  }

  Future<List<Announcement>> announce() async {
    final db = await _databaseService.database;
    List<Map<String, dynamic>> maps = await db.query("announce");
    log("subjectlength:$maps.length");
    return List.generate(
        maps.length, (index) => Announcement.fromMap(maps[index]));
  }

  Future<List<NewEvent>> news() async {
    final db = await _databaseService.database;
    List<Map<String, dynamic>> maps = await db.query("news");
    log("subjectlength:$maps.length");
    return List.generate(maps.length, (index) => NewEvent.fromMap(maps[index]));
  }

  Future<List<KromLuangRoom>> kromluangroom() async {
    final db = await _databaseService.database;
    List<Map<String, dynamic>> maps = await db.query("kromluang_room");
    log("subjectlength:$maps.length");
    return List.generate(
        maps.length, (index) => KromLuangRoom.fromMap(maps[index]));
  }

  Future<List<PueyUngphakorn>> puey() async {
    final db = await _databaseService.database;
    List<Map<String, dynamic>> maps = await db.query("puey_room");
    log("subjectlength:$maps.length");
    return List.generate(
        maps.length, (index) => PueyUngphakorn.fromMap(maps[index]));
  }

  Future<List<BusLines>> bus() async {
    final db = await _databaseService.database;
    List<Map<String, dynamic>> maps = await db.query("buslines");
    log("subjectlength:$maps.length");
    return List.generate(maps.length, (index) => BusLines.fromMap(maps[index]));
  }

  Future<void> insertBookingFromLastBooking(Booking booking) async {
    await insertBooking(booking);
  }

  Future<void> insertBooking(Booking booking) async {
    final db = await _databaseService.database;
    log("insert booking");
    await db.insert(
      'bookings',
      booking.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Booking>> booking() async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query('bookings');
    return List.generate(maps.length, (i) {
      return Booking(
        // Populate Booking object from the map
        userID: maps[i]['student_id'],
        roomBuilding: maps[i]['room_building'],
        roomType: maps[i]['room_type'],
        roomNumber: maps[i]['room_number'],
        time: maps[i]['time'],
      );
    });
  }

  // A method that retrieves all the breeds from the breeds table.
}
