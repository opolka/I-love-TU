import 'package:flutter/material.dart';
import 'package:i_love_tu/profile_page.dart';
import 'package:i_love_tu/model/studentregis.dart';
import 'global.dart';
import 'dart:developer';
import 'services/database_service.dart';
import 'package:i_love_tu/profilepage/payment.dart';
import 'package:i_love_tu/model/student_data.dart';

class RegisterationResultPage extends StatefulWidget {

  final Students user;

  const RegisterationResultPage({super.key, required this.user});



  @override
  State<RegisterationResultPage> createState() =>
      _RegisterationResultPageState();
}

class _RegisterationResultPageState extends State<RegisterationResultPage> {
  final DatabaseService _databaseService = DatabaseService();

  // Future<List<Subject>> _getSubjects() async {
  //   return await _databaseService.subjects();
  // }

  @override
  Widget build(BuildContext context) {
    log("regiester:$screenWidth/$screenHeight");
    // String subject = subjectAddList[0]["subjectname"];

    Color colorYellow = const Color.fromRGBO(243, 235, 163, 1);

    // _databaseService.insertSubject(new Subject(id: "SF211", subjectname: "OOP"
    // , section: "760001", teacher: "AJ.Tonnam"));

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Registeration Result",
            style: TextStyle(
              fontSize: screenWidth / 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Kulim',
              height: 2.5,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Stack(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: 0, right: 0, top: screenHeight / 23, bottom: 0),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth / 14,
                right: screenWidth / 28,
                top: screenHeight / 13.4,
                bottom: 0),
            child: Text(
              "Subjects",
              style: TextStyle(
                  fontFamily: 'Kulim',
                  fontSize: screenWidth / 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 0, right: 0, left: 0),
              child: FutureBuilder<List<StudentRegis>>(
                  future: _databaseService.std_registeration(widget.user.studentID),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text('Error: ${snapshot.error.toString()}'));
                    } else if (snapshot.hasData) {
                      final children = snapshot.data!.map<Widget>((item) {
                        Color subjectcolor = colorYellow;

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
                                            item.section,
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
                                          alignment: Alignment.topRight,
                                          padding: EdgeInsets.only(
                                              top: 0,
                                              bottom: 0,
                                              left: 0,
                                              right: screenWidth / 30),
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
          Padding(
            padding: EdgeInsets.only(
                left: 0, right: 0, top: (screenHeight / 6.5) * 5, bottom: 0),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: 50, right: 0, top: (screenHeight / 6.5) * 5, bottom: 0),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: MaterialButton(
                  minWidth: screenWidth / 3,
                  onPressed: () {
                    //Add data to registeration
                    // subjectAddList
                    //     .forEach((Map<String, dynamic> registeration) {
                    //   StudentRegis regis = new StudentRegis(
                    //     subject: registeration["subjectname"],
                    //     section: registeration["section"],
                    //     teacher: registeration["teacher"],
                    //   );
                    //   _databaseService.insertRegisteration(regis);

                    // subjectAddList.clear();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                 ProfilePage(user: widget.user,))));
                  },
                  color: const Color.fromRGBO(241, 87, 68, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text("Back",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth / 25,
                          fontFamily: 'Kulim',
                          fontWeight: FontWeight.bold)),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(
                  left: 0, right: 50, top: (screenHeight / 6.5) * 5, bottom: 0),
              child: Container(
                alignment: Alignment.bottomRight,
                child: MaterialButton(
                  minWidth: screenWidth / 3,
                  onPressed: () {
                    //Add data to registeration
                    // subjectAddList
                    //     .forEach((Map<String, dynamic> registeration) {
                    //   StudentRegis regis = new StudentRegis(
                    //     subject: registeration["subjectname"],
                    //     section: registeration["section"],
                    //     teacher: registeration["teacher"],
                    //   );
                    //   _databaseService.insertRegisteration(regis);

                    // subjectAddList.clear();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>  PaymentPage(user: widget.user))));
                  },
                  color: const Color.fromARGB(255, 68, 241, 85),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text("payment",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 13, 13, 13),
                          fontSize: screenWidth / 25,
                          fontFamily: 'Kulim',
                          fontWeight: FontWeight.bold)),
                ),
              )),
        ])));
  }
}
