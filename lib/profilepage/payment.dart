import 'package:flutter/material.dart';
import 'package:i_love_tu/bottom_nav_bar.dart';
import 'package:i_love_tu/model/studentregis.dart';
import 'package:i_love_tu/global.dart';
import 'dart:developer';

import 'package:i_love_tu/services/database_service.dart';
import 'package:i_love_tu/model/student_data.dart';

class PaymentPage extends StatefulWidget {
  //const PaymentPage({super.key});

  final Students user;

  const PaymentPage({Key? key, required this.user}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final DatabaseService _databaseService = DatabaseService();
  int totalPayment = 0;
  Future<void> setTotal() async {
    int totalamount = 0;

    try {
      List<Map<String, dynamic>> search =
          await _databaseService.getMyRegis(widget.user.studentID);
      log("get my regis");

      search.forEach((Map<String, dynamic> registItem) {
        int amount = registItem["amount"];
        log("amount $amount");
        log("cal total payment");
        totalamount = totalamount + amount;
      });
    } catch (e) {
      log("data not found");
    }

    setState(() {
      totalPayment = totalamount;
    });
  }

  @override
  void initState() {
    super.initState();
    setTotal();
  }

  @override
  Widget build(BuildContext context) {
    // String subject = subjectAddList[0]["subjectname"];
    Color subjectcolor = const Color.fromARGB(255, 247, 248, 226);

    // _databaseService.insertSubject(new Subject(id: "SF211", subjectname: "OOP"
    // , section: "760001", teacher: "AJ.Tonnam"));

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Payment",
            style: TextStyle(
              fontSize: screenWidth / 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Kulim',
              height: 2.5,
            ),
          )
          ,automaticallyImplyLeading: false,
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
                    color: Color.fromARGB(255, 6, 6, 6),
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
              "Total",
              style: TextStyle(
                  fontFamily: 'Kulim',
                  fontSize: screenWidth / 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 110, bottom: 0, right: 0, left: 30),
              child: Container(
                width: screenWidth / 1.15,
                height: screenHeight / 1.8,
                decoration: BoxDecoration(
                  color: subjectcolor,
                  borderRadius: BorderRadius.circular(20),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 0, right: 0, left: 0),
              child: FutureBuilder<List<StudentRegis>>(
                  future:
                      _databaseService.std_registeration(widget.user.studentID),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                          child: Text(''));
                    } else if (snapshot.hasData) {
                      final children = snapshot.data!.map<Widget>((item) {

                        return Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth / 14,
                              right: screenWidth / 28,
                              top: screenWidth / 23,
                              bottom: 0),
                          child: Row(children: [
                            Expanded(
                                child: Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(
                                  top: 0,
                                  bottom: 0,
                                  left: screenWidth / 30,
                                  right: 0),
                              child: Text(
                                item.subject,
                                style: TextStyle(
                                    fontSize: screenWidth / 28,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Kulim'),
                              ),
                            )),
                            Expanded(
                                child: Container(
                              alignment: Alignment.topRight,
                              padding: EdgeInsets.only(
                                  top: 5,
                                  bottom: 0,
                                  left: 0,
                                  right: screenWidth / 18),
                              child: Text(
                                item.amount.toString(),
                                style: TextStyle(
                                  fontSize: screenWidth / 28,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kulim',
                                  color: const Color.fromARGB(255, 138, 121, 121),
                                ),
                              ),
                            )),
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
                  left: screenWidth / 14,
                  right: screenWidth / 28,
                  top: screenWidth / 23,
                  bottom: 0),
              child: Row(children: [
                Expanded(
                    child: Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(
                      top: screenHeight / 1.85,
                      bottom: 0,
                      left: 0,
                      right: screenWidth / 3),
                  child: Text(
                    "total",
                    style: TextStyle(
                        fontSize: screenWidth / 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kulim',
                        color: Colors.black),
                  ),
                )),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(
                      top: screenHeight / 1.85,
                      bottom: 0,
                      left: screenWidth / 4,
                      right: 0),
                  child: Text(
                    "$totalPayment",
                    style: TextStyle(
                        fontSize: screenWidth / 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kulim',
                        color: Colors.black),
                  ),
                )),
              ])),
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight / 1.7,
                bottom: 0,
                left: screenWidth / 8.5,
                right: screenWidth / 7),
            child: Text(
              "*สามารถชำระได้ที่ เคาท์เตอร์ธนาคารกสิกรไทยทุกสาขา เลขที่บัญชี xxx-x-xxx-xxx มหาวิทยาลัยธรรมศาสตร์\nขอขอบคุณหากท่านได้ชำระแล้ว",
              style: TextStyle(
                  fontSize: screenWidth / 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kulim',
                  color: const Color.fromARGB(255, 233, 35, 35)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 0, right: 0, top: (screenHeight / 6.5) * 5, bottom: 0),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: 0, right: 0, top: (screenHeight / 6.5) * 5, bottom: 0),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  minWidth: screenWidth / 3,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => MyButtomNavBar(
                                  user: widget.user,index: 3,
                                ))));
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
        ])));
  }
}
