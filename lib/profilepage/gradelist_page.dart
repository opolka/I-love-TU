import 'package:flutter/material.dart';
import 'package:i_love_tu/model/studentregis.dart';
import 'package:i_love_tu/services/database_service.dart';
import 'package:i_love_tu/global.dart';
import 'package:i_love_tu/model/student_data.dart';

class GradeListPage extends StatefulWidget {
  final Students user;
  const GradeListPage({super.key, required this.user});

  @override
  State<GradeListPage> createState() => _GradeListPageState();
}

class _GradeListPageState extends State<GradeListPage> {
  final DatabaseService _databaseService = DatabaseService();
  Color colorYellow = const Color.fromRGBO(243, 235, 163, 1);
  Color colorPink = const Color.fromARGB(255, 247, 214, 225);
  Color colorGreen = const Color.fromARGB(255, 166, 223, 167);
  Color colorOrange = const Color.fromARGB(255, 234, 201, 150);
  Color colorBlue = const Color.fromARGB(255, 173, 212, 244);
  Color colorPurple = const Color.fromARGB(255, 236, 173, 247);
  Color colorRed = const Color.fromARGB(255, 248, 139, 132);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Grade",
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
                    fontWeight: FontWeight.bold,
                    height: 2.5,
                    fontFamily: 'Kulim'),
              ),
            ]),
          ),
          Padding(
              padding:
                  const EdgeInsets.only(top: 60, bottom: 0, right: 0, left: 0),
              child: FutureBuilder<List<StudentRegis>>(
                  future:
                      _databaseService.std_registeration(widget.user.studentID),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Grade Data not found!'));
                    } else if (snapshot.hasData) {
                      final children = snapshot.data!.map<Widget>((item) {
                        Color subjectcolor = colorYellow;

                        subjectcolor = colorYellow;

                        return Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth / 14,
                              right: screenWidth / 28,
                              top: 10,
                              bottom: 0),
                          child: Row(children: [
                            Row(children: [
                              Container(
                                width: screenWidth / 1.21,
                                height: screenHeight / 13,
                                decoration: BoxDecoration(
                                  color: subjectcolor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Row(children: [
                                      Expanded(
                                          child: Container(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.only(
                                            top: screenWidth / 40,
                                            bottom: 0,
                                            left: screenWidth / 40,
                                            right: 0),
                                        child: Text(
                                          item.subject,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Kulim'),
                                        ),
                                      )),
                                    ]),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.only(
                                              top: 0,
                                              bottom: 0,
                                              left: screenWidth / 35,
                                              right: 0),
                                          child: Text(
                                            item.teacher,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Kulim',
                                              color: Color.fromARGB(
                                                  255, 138, 121, 121),
                                            ),
                                          ),
                                        )),
                                        Container(
                                            padding: EdgeInsets.only(
                                                top: 0,
                                                bottom: 0,
                                                left: 0,
                                                right: screenWidth / 9),
                                            child: item.grade != ''
                                                ? Text(
                                                    item.grade,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      fontFamily: 'Kulim',
                                                      color: Color.fromARGB(
                                                          255, 138, 121, 121),
                                                    ),
                                                  )
                                                : const Text(
                                                    '-',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Color.fromARGB(
                                                          255, 138, 121, 121),
                                                    ),
                                                  )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ]),
                          ]),
                        );
                      }).toList();
                      return Column(children: children);
                    } else {
                      return const Center(child: Text('No data'));
                    }
                  })),
        ])));
  }
}
