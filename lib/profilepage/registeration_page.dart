import 'package:flutter/material.dart';
import 'package:i_love_tu/model/registeration.dart';
import 'package:i_love_tu/profilepage/registeration2.dart';
import 'package:i_love_tu/global.dart';
import 'dart:developer';
import 'dart:async';
import 'package:i_love_tu/model/student_data.dart';
import 'package:i_love_tu/services/database_service.dart';

class RegisterationPage extends StatefulWidget {
  final Students user;

  const RegisterationPage({super.key, required this.user});

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  final DatabaseService _databaseService = DatabaseService();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();

  int _totalseat = 0;
  int _seatavail = 0;

  Future<void> checkIsRegister() async {
    try {
      List<Map<String, dynamic>> search =
          await _databaseService.getMyRegis(widget.user.studentID);

      if (search.isNotEmpty) {
        isRegister = true;
        log(" register exists");
      }
    } catch (e) {
      isRegister = false;
    }
  }

  @override
  void initState() {
    super.initState();
    checkIsRegister();
  }

  @override
  Widget build(BuildContext context) {
    log("regiester:$screenWidth/$screenHeight");

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Registeration",
            style: TextStyle(
              fontSize: screenWidth / 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Kulim',
              height: 2.5,
            ),
          ),
          // leading: Padding(
          //   padding: EdgeInsets.only(left: 20),
          //   child: BackButton(),
          // ),
        ),
        body: SingleChildScrollView(
            child: Stack(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: 0, right: 0, top: screenHeight / 23, bottom: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth / 9.5, right: 0, top: 70, bottom: 0),
            child: Row(children: [
              Text(
                //เดี๋ยวค่อยดึงมาจากดาต้าเบส
                "Subjects",
                style: TextStyle(
                    fontSize: screenWidth / 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 2.5,
                    fontFamily: 'Kulim'),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 0, right: 0, top: screenHeight / 7.8, bottom: 0),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 44, vertical: 0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(230, 105, 99, 99),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: TextField(
                controller: _subjectController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30.57),
                  border: InputBorder.none,
                  hintText: "XX XXX",
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(235, 242, 239, 239),
                      fontSize: screenWidth / 25),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth / 9.5,
                right: 0,
                top: screenHeight / 5.2,
                bottom: 0),
            child: Row(children: [
              Text(
                //เดี๋ยวค่อยดึงมาจากดาต้าเบส
                "Section",
                style: TextStyle(
                    fontSize: screenWidth / 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 2.5,
                    fontFamily: 'Kulim'),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 0, right: 0, top: screenHeight / 4.05, bottom: 0),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 44, vertical: 0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(230, 105, 99, 99),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: TextField(
                controller: _sectionController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30.57),
                  border: InputBorder.none,
                  hintText: "XX000X",
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(235, 242, 239, 239),
                      fontSize: screenWidth / 25),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 0,
                right: padding_register_right(),
                top: screenHeight / 3.2,
                bottom: 0),
            child: Expanded(
                child: Container(
              alignment: Alignment.topRight,
              child: Text("Seat Available",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: app_font_bold(),
                      fontFamily: 'Kulim',
                      color: Colors.white)),
            )),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth / 9.5,
                right: 0,
                top: screenHeight / 3.1,
                bottom: 0),
            child: Row(
              children: [
                MaterialButton(
                  minWidth: screenWidth / 4.5,
                  onPressed: () async {
                    //Add Registeration

                    try {
                      List<Map<String, dynamic>> search = await _databaseService
                          .getRegisterData(_subjectController.text,_sectionController.text);


                      setState(() {
                        _seatavail = search[0]["seatavai"];
                        _totalseat = search[0]["totalseat"];
                      });
                    } catch (e) {
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            title: Text("information"),
                            content: Text("Search not found!"),
                            actions: [],
                          );
                        },
                      );
                    }
                  },
                  color: const Color.fromARGB(255, 252, 250, 249),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text("search",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 11, 4, 4),
                          fontSize: screenWidth / 25,
                          fontFamily: 'Kulim',
                          fontWeight: FontWeight.bold)),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.event_seat,
                    color: Colors.orange,
                    size: screenWidth / 13,
                  ),
                )),
                Expanded(
                    child: Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(
                      top: 0,
                      bottom: 0,
                      left: screenWidth / 40,
                      right: screenWidth / 7),
                  child: Text("$_seatavail/$_totalseat",
                      style: TextStyle(
                          fontSize: screenWidth / 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kulim',
                          color: Colors.orange)),
                )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenWidth / 1.2, bottom: 0, left: 0, right: 0),
            child: Center(
                child: MaterialButton(
              minWidth: screenWidth / 2,
              height: screenHeight / 17,
              onPressed: () async {
                if (isRegister == false) {
                  if (_seatavail > 0) {
                    List<Map<String, dynamic>> search = await _databaseService
                        .getRegisterData(_subjectController.text,_sectionController.text);

                    Registeration registeration = Registeration(
                      amount: search[0]["amount"],
                      id: search[0]["id"],
                      subjectname: search[0]["subjectname"],
                      section: _sectionController.text,
                      teacher: search[0]["teacher"],
                      seatavai: _seatavail,
                      totalseat: _totalseat,
                      start_time: "",
                      day: '',
                      end_time: "",
                      day_exam: "",
                      time_exam: "",
                      room_exam: "",
                      location_exam: "",
                      study_hour: 0,
                      teacherDepartment: "",
                        teacherEmail: "",
                        teacherLine: "",
                        teacherOffice: "",
                        teacherTel: "",
                        // imageURL: ""
                    );

                    if (!cheeckDuplicateSubject(search[0]["id"])) {
                      if (_sectionController.text.length > 5) {
                        subjectAddList.add(registeration.toMap());
                        setState(() {
                          _seatavail = 0;
                          _totalseat = 0;
                        });
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    RegisterationPage2(user: widget.user))));
                      } else {
                        // ignore: use_build_context_synchronously
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              title: Text("information"),
                              content: Text("Please input section!"),
                              actions: [],
                            );
                          },
                        );
                      }
                    }
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          title: Text("information"),
                          content: Text("Please input data!"),
                          actions: [],
                        );
                      },
                    );
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialog(
                        title: Text("information"),
                        content: Text("You are aleady registration!"),
                        actions: [],
                      );
                    },
                  );
                }
              },
              color: const Color.fromARGB(255, 218, 116, 91),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text("Add",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth / 25,
                      fontFamily: 'Kulim',
                      fontWeight: FontWeight.bold)),
            )),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 0, right: 0, top: screenHeight / 2.1, bottom: 0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 2,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 254, 245, 163),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth / 14,
                right: 0,
                top: screenHeight / 1.98,
                bottom: 0),
            child: Text(
              "Explore Subject",
              style: TextStyle(
                  fontFamily: 'Kulim',
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth / 17),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 520, bottom: 0, right: 0, left: 0),
              child: FutureBuilder<List<Registeration>>(
                  future: _databaseService.registeration(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text('Error: ${snapshot.error.toString()}'));
                    } else if (snapshot.hasData) {
                      final children = snapshot.data!.map<Widget>((item) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth / 14,
                              right: 0,
                              top: 10,
                              bottom: 0),
                          child: Row(children: [
                            Container(
                              width: screenWidth / 1.17,
                              height: screenHeight / 7,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 243, 236, 178),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  // Adding some space between icon and text
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
                                        item.subjectname,
                                        style: const TextStyle(
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
                                            left: screenWidth / 40,
                                            right: 0),
                                        child: Text(
                                          item.id,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Kulim',
                                            color: Color.fromARGB(
                                                255, 138, 121, 121),
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 0,
                                              left: 0,
                                              right: screenWidth / 21,
                                              bottom: 0),
                                          alignment: Alignment.topRight,
                                          child: IconButton(
                                            icon: const Icon(Icons.add_circle),
                                            onPressed: () {
                                              if (isRegister == false) {
                                                Registeration registeration =
                                                    Registeration(
                                                        amount: item.amount,
                                                        id: item.id,
                                                        subjectname:
                                                            item.subjectname,
                                                        section: item.section,
                                                        teacher: item.teacher,
                                                        seatavai: item.seatavai,
                                                        totalseat:
                                                            item.totalseat,
                                                        start_time:
                                                            item.start_time,
                                                        day: item.day,
                                                        end_time: item.end_time,
                                                        day_exam: item.day_exam,
                                                        time_exam:
                                                            item.time_exam,
                                                        room_exam:
                                                            item.room_exam,
                                                        location_exam:
                                                            item.location_exam,
                                                        study_hour:
                                                            item.study_hour,
                                                            teacherDepartment: item.teacherDepartment,
                        teacherEmail: item.teacherEmail,
                        teacherLine: item.teacherLine,
                        teacherOffice: item.teacherOffice,
                        teacherTel: item.teacherTel,
                        // imageURL: item.imageURL
                                                            );

                                                if (!cheeckDuplicateSubject(
                                                    item.id)) {
                                                  subjectAddList.add(
                                                      registeration.toMap());

                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: ((context) =>
                                                              RegisterationPage2(
                                                                  user: widget
                                                                      .user))));
                                                } else {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return const AlertDialog(
                                                        title:
                                                            Text("information"),
                                                        content: Text(
                                                            "You are already added!"),
                                                        actions: [],
                                                      );
                                                    },
                                                  );
                                                }
                                              } else {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return const AlertDialog(
                                                      title:
                                                          Text("information"),
                                                      content: Text(
                                                          "You are already registration!"),
                                                      actions: [],
                                                    );
                                                  },
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.only(
                                            top: 0,
                                            bottom: 0,
                                            left: screenWidth / 40,
                                            right: 0),
                                        child: Text(item.section,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Kulim',
                                                color: Color.fromARGB(
                                                    255, 138, 121, 121))),
                                      )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          child: Container(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.only(
                                            top: 0,
                                            bottom: 0,
                                            left: screenWidth / 40,
                                            right: screenWidth / 40),
                                        child: Icon(
                                          Icons.event_seat,
                                          color: Colors.orange,
                                          size: screenWidth / 20,
                                        ),
                                      )),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "${item.seatavai}/${item.totalseat}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Kulim',
                                            color: Color.fromARGB(255, 138, 121, 121)),
                                          )),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.only(
                                          top: 0,
                                          bottom: 0,
                                          left: screenWidth / 40,
                                          right: screenWidth / 40),
                                                                              child: Icon(
                                      Icons.account_circle,
                                      color: const Color.fromARGB(
                                          255, 138, 121, 121),
                                      size: screenWidth / 21,
                                                                              ),
                                                                            ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(item.teacher,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Kulim',
                                            color: Color.fromARGB(
                                                255, 138, 121, 121))),
                                                                            ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ]),
                        );
                      }).toList();
                      return Column(children: children);
                    } else {
                      return const Center(child: Text('No data'));
                    }
                  }))
        ])));
  }
}
