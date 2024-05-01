import 'package:flutter/material.dart';
import 'package:i_love_tu/global.dart';
import 'package:i_love_tu/model/student_data.dart';
import 'package:i_love_tu/profilepage/request/card/formRequest.dart';
import 'package:i_love_tu/profilepage/request/register/regis_select.dart';
import 'package:i_love_tu/profilepage/request/resign/page1.dart';
import 'package:i_love_tu/profilepage/request/inform/informpage1.dart';

class MyOnlineRequestPage extends StatefulWidget {
  final Students user;

  const MyOnlineRequestPage({super.key, required this.user});

  @override
  State<MyOnlineRequestPage> createState() => _MyOnlineRequestPageState();
}

class _MyOnlineRequestPageState extends State<MyOnlineRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Online Request",
            style: TextStyle(
              fontSize: screenWidth / 15.4,
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
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth / 9.8,
                right: screenWidth / 28.5,
                top: screenWidth / 31, //30 จาก 50
                bottom: 0),
            child: Container(
              width: screenWidth / 1.26,
              height: screenHeight / 3.1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(1, 2),
                    )
                  ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight/3.7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  padding: EdgeInsets.only(
                      left: screenWidth / 86, right: 0, top: 0, bottom: 0),
                  minWidth: screenWidth / 1.6,
                  height: screenHeight / 20,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const FormRequest(
                                  
                                ))));
                  },
                  color: const Color.fromRGBO(241, 87, 68, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text("select",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Kulim',
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: screenWidth / 9.8,
                  right: screenWidth / 28.5,
                  top: screenWidth / 31, //30 จาก 50
                  bottom: 0),
              child: Container(
                width: screenWidth / 1.26,
                height: screenHeight / 4.2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                     
                      image: const AssetImage("assets/images/re2.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          const Color.fromARGB(255, 68, 51, 51)
                              .withOpacity(0.8),
                          BlendMode.darken)),
                  borderRadius: BorderRadius.circular(30),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(top: screenHeight/4.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "คำร้องทำบัตรนักศึกษา",
                  style: TextStyle(
                      fontSize: screenWidth / 21,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'Athiti',
                      height: 1.1,
                      color: Colors.white),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth / 9.8,
                right: screenWidth / 28.5,
                top: screenHeight / 2.75, //30 จาก 50
                bottom: 0),
            child: Container(
              width: screenWidth / 1.26,
              height: screenHeight / 3.1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(1, 2),
                    )
                  ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight/1.62),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  padding: EdgeInsets.only(
                      left: screenWidth / 86, right: 0, top: 0, bottom: 0),
                  minWidth: screenWidth / 1.6,
                  height: screenHeight / 20,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const FormRequestResign(
                                  
                                ))));
                  },
                  color: const Color.fromRGBO(241, 87, 68, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text("select",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Kulim',
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: screenWidth / 9.8,
                  right: screenWidth / 28.5,
                  top: screenHeight / 2.75, //30 จาก 50
                  bottom: 0),
              child: Container(
                width: screenWidth / 1.26,
                height: screenHeight / 4.2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage("assets/images/resign.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          const Color.fromARGB(255, 68, 51, 51)
                              .withOpacity(0.8),
                          BlendMode.darken)),
                  borderRadius: BorderRadius.circular(30),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(top: screenHeight/1.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "คำร้องขอลาออก/ลาพักการศึกษา",
                  style: TextStyle(
                      fontSize: screenWidth / 24,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'Athiti',
                      height: 1.1,
                      color: Colors.white),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth / 9.8,
                right: screenWidth / 28.5,
                top: screenHeight / 1.4, //30 จาก 50
                bottom: 0),
            child: Container(
              width: screenWidth / 1.26,
              height: screenHeight / 3.1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(1, 2),
                    )
                  ]),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: screenWidth / 9.8,
                  right: screenWidth / 28.5,
                  top: screenHeight / 1.4, //30 จาก 50
                  bottom: 0),
              child: Container(
                width: screenWidth / 1.26,
                height: screenHeight / 4.2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage("assets/images/request.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          const Color.fromARGB(255, 68, 51, 51)
                              .withOpacity(0.8),
                          BlendMode.darken)),
                  borderRadius: BorderRadius.circular(30),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(top: screenHeight/1.11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "คำร้องขอหลักฐานการศึกษา",
                  style: TextStyle(
                      fontSize: screenWidth / 21,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'Athiti',
                      height: 1.1,
                      color: Colors.white),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight/1.035),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  padding: EdgeInsets.only(
                      left: screenWidth / 86, right: 0, top: 0, bottom: 0),
                  minWidth: screenWidth / 1.6,
                  height: screenHeight / 20,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const InformationPage(
                                  
                                ))));
                  },
                  color: const Color.fromRGBO(241, 87, 68, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text("select",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Kulim',
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth / 9.8,
                right: screenWidth / 28.5,
                top: screenHeight / 0.94, //30 จาก 50
                bottom: 0),
            child: Container(
              width: screenWidth / 1.26,
              height: screenHeight / 3.1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(1, 2),
                    )
                  ]),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: screenWidth / 9.8,
                  right: screenWidth / 28.5,
                  top: screenHeight / 0.94, //30 จาก 50
                  bottom: 0),
              child: Container(
                width: screenWidth / 1.26,
                height: screenHeight / 4.2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                       image: const AssetImage("assets/images/re1.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          const Color.fromARGB(255, 68, 51, 51)
                              .withOpacity(0.8),
                          BlendMode.darken)),
                  borderRadius: BorderRadius.circular(30),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 1.2439),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "คำร้องจดทะเบียน",
                  style: TextStyle(
                      fontSize: screenWidth / 25,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'Athiti',
                      height: 1.1,
                      color: Colors.white),
                ),
               
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight*1.267),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "เพิกถอนรายวิชาและล่าช้ากรณีพิเศษ",
                  style: TextStyle(
                      fontSize: screenWidth / 25,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'Athiti',
                      height: 1.1,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight*1.315),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  padding: EdgeInsets.only(
                      left: screenWidth / 86, right: 0, top: 0, bottom: 0),
                  minWidth: screenWidth / 1.6,
                  height: screenHeight / 20,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const RegisterPage(
                                  
                                ))));
                  },
                  color: const Color.fromRGBO(241, 87, 68, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text("select",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Kulim',
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
        ])));
  }
}
