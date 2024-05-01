import 'package:flutter/material.dart';
import 'package:i_love_tu/model/studentregis.dart';
import 'package:i_love_tu/services/database_service.dart';
import 'package:i_love_tu/model/student_data.dart';

class ClassPage extends StatefulWidget {
  final Students user;
  const ClassPage({super.key, required this.user});

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  final DatabaseService _databaseService = DatabaseService();
  double tableTop = 0;
  double tableLeft = 0;
  double tableRigth = 0;
  double tableHeight = 20;
  double tableWidth = 55;
  List<StudentRegis> classes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Class",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'Kulim',
              height: 2.5,
            ),
          ),
          leading: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: BackButton(),
          ),
        ),
        body: SingleChildScrollView(
            child: Stack(children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 35, right: 15, top: 10, bottom: 0),
            child: Row(children: [
              Text(
                //เดี๋ยวค่อยดึงมาจากดาต้าเบส
                "1/2023",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 2.5,
                    fontFamily: 'Kulim'),
              ),
            ]),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 32, right: 15, top: 60, bottom: 0),
            child: Container(
              width: 360,
              height: 265,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Adding some space between icon and text

                  Column(
                    children: [
                      Table(
                          border: TableBorder.all(
                              color: const Color.fromARGB(255, 221, 218, 218),
                              borderRadius: BorderRadius.circular(15)),
                          columnWidths: const {
                            0: FixedColumnWidth(70),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(children: [
                              const Column(
                                children: [Text("")],
                              ),
                              buildRow('08:00'),
                              buildRow('09:30'),
                              buildRow('11:00'),
                              buildRow('12:30'),
                              buildRow('14:00'),
                              buildRow('15:30'),
                              buildRow('17:00'),
                              buildRow('18:30'),
                              buildRow('20:00')
                            ]),
                            buildColumn('Monday'),
                            buildColumn('Tuesday'),
                            buildColumn('Wednesday'),
                            buildColumn('Thursday'),
                            buildColumn('Friday'),
                            buildColumn('Saturday'),
                            buildColumn('Sunday')
                          ]),
                      const Text("     "),
                    ],
                  )
                ],
              ),
            ),
          ),
          const Padding(
            //กรอบแรก
            padding: EdgeInsets.only(left: 15, right: 15, top: 340, bottom: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Subject",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      height: 2.5,
                      fontFamily: 'Kulim'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 390),
            child: FutureBuilder<List<StudentRegis>>(
                future:
                    _databaseService.getMyRegistDetail(widget.user.studentID),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Class not found!'));
                  } else if (snapshot.hasData) {
                    final children = snapshot.data!.map<Widget>((item) {
                      Color subjectcolor = selectedColor(item.day);
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 15, top: 15, bottom: 0),
                        child: Container(
                          width: 367,
                          height: 90,
                          decoration: BoxDecoration(
                              color: subjectcolor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(1, 2),
                                )
                              ]),
                          child: Column(
                            children: [
                              // Adding some space between icon and text

                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 0,
                                        left: 10,
                                        right: 10),
                                    child: Text(
                                      item.subjectID,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Kulim'),
                                    ),
                                  )),
                                  Expanded(
                                      child: Container(
                                    alignment: Alignment.topRight,
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 0,
                                        left: 10,
                                        right: 10),
                                    child: Text(item.section,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Kulim')),
                                  )),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 0, left: 10, right: 10),
                                    child: Text(item.subject,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Kulim')),
                                  )),
                                  Expanded(
                                      child: Container(
                                    alignment: Alignment.topRight,
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 0, left: 10, right: 10),
                                    child: Text(
                                        "${item.day} ${item.start_time}-${item.end_time}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Kulim')),
                                  )),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 0, left: 10, right: 10),
                                    child: const Icon(
                                      Icons.account_circle,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(item.teacher,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Kulim')),
                                  )),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList();

                    return Column(children: children);
                  } else {
                    return const Center(child: Text('No data'));
                  }
                }),
          ),
          FutureBuilder<List<StudentRegis>>(
            future: _databaseService.getMyRegistDetail(widget.user.studentID),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Class not found!'));
              } else if (snapshot.hasData) {
                final classInDaysFuture = selectInDay(snapshot.data!);
                return FutureBuilder<List<List<StudentRegis>>>(
                  future: classInDaysFuture,
                  builder: (context, classInDaysSnapshot) {
                    if (classInDaysSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (classInDaysSnapshot.hasError) {
                      return const Center(
                          child: Text('Class in days not found!'));
                    } else if (classInDaysSnapshot.hasData) {
                      final classInDays = classInDaysSnapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.only(top: 100, left: 103),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var classInDay in classInDays)
                              Container(
                                // margin: EdgeInsets.only(
                                //   left: classInDay.isNotEmpty
                                //       ? getStart(classInDay[0].start_time)
                                //       : 0
                                // ),

                                height: 30,
                                child: buildTimeLine(context, classInDay),
                              ),
                          ],
                        ),
                      );
                    } else {
                      return const Center(child: Text('No data'));
                    }
                  },
                );
              } else {
                return const Center(child: Text('No data'));
              }
            },
          ),
        ])));
  }
}

Widget buildRow(String time) {
  return Container(
    height: 35,
    alignment: Alignment.center,
    child: Text(
      time,
      style: const TextStyle(
          fontSize: 9, fontFamily: 'Kulim', fontWeight: FontWeight.w600),
    ),
  );
}

TableRow buildColumn(String day) {
  return TableRow(
    children: [
      Container(
          height: 30,
          alignment: Alignment.center,
          child: Text(
            day,
            style: const TextStyle(
                fontSize: 10, fontFamily: 'Kulim', fontWeight: FontWeight.w600),
          )),
      const Column(
        children: [Text("")],
      ),
      const Column(
        children: [Text("")],
      ),
      const Column(
        children: [Text("")],
      ),
      const Column(
        children: [Text("")],
      ),
      const Column(
        children: [Text("")],
      ),
      const Column(
        children: [Text("")],
      ),
      const Column(
        children: [Text("")],
      ),
      const Column(
        children: [Text("")],
      ),
      const Column(
        children: [Text("")],
      ),
    ],
  );
}

final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

Future<List<List<StudentRegis>>> selectInDay(List<StudentRegis> classes) async {
  List<List<StudentRegis>> result = [];
  for (String day in days) {
    List<StudentRegis> classInDay =
        classes.where((item) => item.day == day).toList();
    classInDay.sort((a, b) => a.start_time.compareTo(b.start_time));
    result.add(classInDay);
  }
  return result;
}

Widget buildTimeLine(BuildContext context, List<StudentRegis> classInDay) {
  classInDay.sort((a, b) => a.start_time.compareTo(b.start_time));
  return Stack(
    // alignment: Alignment.centerLeft,
    children: classInDay.map((item) {
      Color colorDay = selectedColor(item.day);
      return Container(
        margin: EdgeInsets.only(bottom: 15, left: getStart(item.start_time)),
        width: item.study_hour * 21.5,
        height: 15,
        decoration: BoxDecoration(
          color: colorDay,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              offset: Offset(1, 2),
            )
          ],
        ),
      );
    }).toList(),
  );
}

double getStart(String startTime) {
  if (startTime.isNotEmpty) {
    switch (startTime) {
      case '8:00':
        return 0;
      case '8:30':
        return 10;
      case '9:30':
        return 30;
      case '13:30':
        return 115;
      case '16:30':
        return 180;
      default:
        return 0;
    }
  }
  return 0;
}

Color selectedColor(String day) {
  switch (day) {
    case 'Mon':
      return const Color.fromRGBO(244, 231, 123, 1);
    case 'Tue':
      return const Color.fromARGB(255, 255, 179, 205);
    case 'Wed':
      return const Color.fromARGB(255, 174, 235, 176);
    case 'Thu':
      return const Color.fromARGB(255, 255, 189, 141);
    case 'Fri':
      return const Color.fromARGB(255, 137, 202, 255);
    case 'Sat':
      return const Color.fromARGB(255, 217, 153, 229);
    case 'Sun':
      return const Color.fromARGB(255, 219, 129, 122);

    default:
      return Colors.white;
  }
}



      // switch (item.start_time) {
      // case '8:00':start = 0;break;
      // case '8:30':start = 10;break;
      // case '9:30':start = 0;break;
      // case '13:30':start = 115;break;
      // case '16:30':start = 180;break;
      // default:start = 0;
      // }
