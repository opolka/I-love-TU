import 'package:flutter/material.dart';
import 'package:i_love_tu/model/studentregis.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:developer';
import 'package:i_love_tu/services/database_service.dart';
import 'package:i_love_tu/model/student_data.dart';
class ExaminationPage extends StatefulWidget {
  final Students user;
  const ExaminationPage({super.key, required this.user});

  @override
  State<ExaminationPage> createState() => _ExaminationPageState();
}

class _ExaminationPageState extends State<ExaminationPage> {
  final DatabaseService _databaseService = DatabaseService();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.utc(2024, 4, 21);

  final Set<DateTime> _selectedDays = {};
  Future<void> setDefaultData() async {
    try {
 List<Map<String, dynamic>> search =await _databaseService.getMyRegistDetailDynamic(widget.user.studentID);
    log("get my regis");
    
    for (var subjecItem in search) {
      List<String> dayArray = subjecItem["day_exam"].split("/");
          log("data$dayArray");
          setState(() {
                _selectedDays.add(DateTime.utc(int.parse(dayArray[2]),
              int.parse(dayArray[1]), int.parse(dayArray[0])));
          });
      

    
    }
    } catch (e) {
      /*
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("information"),
            content: Text("your examination not found!"),
            actions: [],
          );
        },
      );
      */
    }
  }

  @override
  void initState() {
    super.initState();
   setDefaultData();
  }

  bool _isSelected(DateTime day) {
    return _selectedDays.contains(day);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Examination",
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
            child: Column(children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 20, bottom: 0),
              child: Container(
                  width: 367,
                  height: 350,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          offset: Offset(2, 2),
                        )
                      ]),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(children: [
                          TableCalendar(
                            rowHeight: 38,

                            firstDay: DateTime.utc(2024, 1, 1),
                            lastDay: DateTime.utc(2024, 12, 31),
                            focusedDay: DateTime.utc(2024, 4, 21),

                            calendarFormat: _calendarFormat,

                            onPageChanged: (focusedDay) {
                              _focusedDay = focusedDay;
                              log('pagedata:$_focusedDay');
                            },
                            onFormatChanged: (format) {
                              setState(() {
                                _calendarFormat = format;
                                log('formdata:$_focusedDay');
                              });
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                //_selectedDay = selectedDay;
                                //_focusedDay = focusedDay;
                                _focusedDay = focusedDay;
                                //_selectedDays.add(selectedDay);
                                // Update values in a Set
                                if (_selectedDays.contains(selectedDay)) {
                                  //_selectedDays.remove(selectedDay);
                                } else {
                                 //_selectedDays.add(selectedDay);
                                }
                              });
                            },
                            // selectedDayPredicate: (day) {
                            //   return isSameDay(_selectedDays.contains(day), day);
                            // },
                            selectedDayPredicate: _isSelected,
                            // Optional: Define custom styles
                            calendarStyle: const CalendarStyle(
                              todayDecoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              selectedDecoration: BoxDecoration(
                                color: Color.fromARGB(255, 221, 108, 108),
                                shape: BoxShape.circle,
                              ),
                              selectedTextStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ])
                      ]))),
          const Padding(
            //กรอบแรก
            padding:
                EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "  Subject",
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
              padding: const EdgeInsets.only(top: 5, bottom: 0, right: 0, left: 0),
              child: FutureBuilder<List<StudentRegis>>(
                  future: _databaseService.getMyRegistDetail(widget.user.studentID),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('your examination not found'));
                    } else if (snapshot.hasData) {
                      final children = snapshot.data!.map<Widget>((item) {
                        Color subjectcolor = const Color.fromARGB(255, 128, 225, 198);
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 0),
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
                                          top: 5,
                                          bottom: 0,
                                          left: 10,
                                          right: 10),
                                      child: Text(item.subject,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Kulim')),
                                    )),
                                    Expanded(
                                        child: Container(
                                      alignment: Alignment.topRight,
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 0,
                                          left: 10,
                                          right: 10),
                                      child: Text(
                                          "${item.day_exam} ${item.time_exam}",
                                          style: const TextStyle(
                                              fontSize: 12,
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
                                        top: 5,
                                        bottom: 0,
                                        left: 10,
                                        right: 10),
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
                                    Expanded(
                                        child: Container(
                                      alignment: Alignment.topRight,
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 0,
                                          left: 10,
                                          right: 10),
                                      child: Text(
                                          "${item.room_exam} ${item.location_exam}",
                                          style: const TextStyle(
                                              fontSize: 13,
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
                  } //161
                  ))
        ])));
  }
}
