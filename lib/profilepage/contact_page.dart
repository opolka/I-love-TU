import 'package:flutter/material.dart';
import 'package:i_love_tu/app_colors.dart';
import 'package:i_love_tu/model/studentregis.dart';
import 'package:i_love_tu/services/database_service.dart';
import 'package:i_love_tu/model/student_data.dart';

class ContactPage extends StatefulWidget {
  final Students user;

  const ContactPage({super.key, required this.user});

  @override
  State<ContactPage> createState() => _NotificationState();
}

class _NotificationState extends State<ContactPage> {
  final DatabaseService _databaseService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    final screenMediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Contact',
            )),
        body: SingleChildScrollView(
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
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        child: Column(
                          children: [
                            boxContainer(
                                screenMediaHeight,
                                item.subjectID,
                                item.teacherDepartment,
                                item.teacher,
                                item.teacherTel,
                                item.teacherLine,
                                item.teacherEmail,
                                item.teacherOffice,
                                item.imageURL)
                          ],
                        ),
                      );
                    }).toList();

                    return Column(children: children);
                  } else {
                    return const Center(child: Text('No data'));
                  }
                })));
  }

  Widget boxContainer(
      double screenMediaHeight,
      String subjectID,
      String teacherDepartment,
      String teacher,
      String teacherTel,
      String techerLine,
      String techerEmail,
      String techerOffice,
      String imageURL) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenMediaHeight / 5,
      width: screenwidth,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(248, 225, 146, 1),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Stack(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                  width: screenwidth / 3.5,
                  //height: screenMediaHeight / 6.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              '/Users/pornlavin/Desktop/opol_tuapp/assets/teacher/$imageURL'),
                          fit: BoxFit.cover),
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25))
                    )
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      teacher,
                      style: TextStyle(
                        fontSize: screenMediaHeight * 0.017,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'Department : $teacherDepartment \nTel : $teacherTel\nLine ID : $techerLine\nEmail  : $techerEmail@gmail.com\nOffice  : $techerOffice',
                      style: TextStyle(fontSize: screenMediaHeight * 0.0115),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 20,
                  width: screenwidth / 5,
                  decoration: const BoxDecoration(
                    color: AppColors.btn_orange,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                  ),
                  child: Center(
                    child: Text(subjectID,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}
