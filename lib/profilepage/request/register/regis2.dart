import 'package:flutter/material.dart';
import 'package:i_love_tu/model/evidence_regis/regisInfo.dart';
import 'package:i_love_tu/model/information.dart';
import 'package:i_love_tu/widget/button.dart';
import 'package:i_love_tu/widget/date.dart';
import 'package:i_love_tu/widget/form.dart';
import 'package:i_love_tu/widget/type.dart';
class RegisterForm extends StatefulWidget {
  final ValueChanged<UserRegister> onSaveUser;

  const RegisterForm({
    Key? key,
    required this.onSaveUser,
  }) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final globalKey = GlobalKey<FormState>();
  late final ValueChanged<UserRegister> onSaveUser;
  late String dropdownGender;
  late String dropdownFaculity;
  late String dropdownMajor;
  late String dropdownTitle;
  late String dropdownList;
  late TextEditingController _controllerThaiName;
  late TextEditingController _controllerEngName;
  late TextEditingController _controllerDateOfBirth;
  late TextEditingController _controllerYear;
  late TextEditingController _controllerAcademicYear;
  late TextEditingController _controllerIDCard;
  late TextEditingController _controllerStuCard;
  late TextEditingController _controllerNumber;
  late TextEditingController _controllerSection;

  @override
  void initState() {
    super.initState();
    intitUser();
  }

  void intitUser() {
    _controllerThaiName = TextEditingController();
    _controllerEngName = TextEditingController();
    _controllerDateOfBirth = TextEditingController();
    _controllerYear = TextEditingController();
    _controllerAcademicYear = TextEditingController();
    _controllerIDCard = TextEditingController();
    _controllerStuCard = TextEditingController();
    _controllerSection = TextEditingController();
    _controllerNumber = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = '';
    final screenMediaHeight = MediaQuery.of(context).size.height;
    final screenMediaWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'คำร้องขอจดทะเบียน / เพิกถอนรายวิชา ล่าช้า',
              style: TextStyle(fontSize: 19),
              maxLines: 2,
            )),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(248, 225, 146, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100))),
              child: Form(
                key: globalKey,
                child: Padding(
                  padding: EdgeInsets.only(left: screenMediaWidth * 0.015),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenMediaHeight / 20, bottom: 10),
                        child: Column(
                          children: [
                            Text('โปรดตรวจสอบข้อมูล และ แก้ไขข้อมูล',
                                style: TextStyle(
                                  fontSize: screenMediaHeight * 0.02,
                                  fontWeight: FontWeight.w600,
                                )),
                            Text(
                              'กรณีข้อมูลไม่ถูกต้อง',
                              style: TextStyle(
                                  fontSize: screenMediaHeight * 0.021,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Text('คำนำหน้า :',style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.018,color: Colors.black)),
                        title: SizedBox(
                          child: DropdownMenu<String> (
                            width: screenMediaWidth*0.65,
                            inputDecorationTheme: inputDecorationTheme,
                            initialSelection: title.first,
                          onSelected: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                              dropdownTitle = '$dropdownValue';
                            });
                            },
                            dropdownMenuEntries: title.map    <DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(value: value, label: value);
                            }).toList(),
                          ),
                        ),
                      ),
                      InputCreate(
                        ctllerText: _controllerThaiName,
                        title: 'ชื่อ - นามสกุล :',
                      ),
                      InputCreate(
                        ctllerText: _controllerEngName,
                        title: 'Fullname:',
                      ),
                      SelectDate(
                        ctllerText: _controllerDateOfBirth,
                        title: 'วัน/เดือน/ปีเกิด :',
                      ),
                      ListTile(
                        leading: Text('คณะ :',style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.018,color: Colors.black)),
                        title: DropdownMenu<String> (
                          width: screenMediaWidth*0.75,
                          inputDecorationTheme: inputDecorationTheme,
                          initialSelection: faculty.first,
                        onSelected: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                            dropdownFaculity = '$dropdownValue';
                          });
                          },
                          dropdownMenuEntries: faculty.map    <DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(value: value, label: value);
                          }).toList(),
                        ),
                      ),
                      ListTile(
                        leading: Text('สาขา :',style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.018,color: Colors.black)),
                        title: DropdownMenu<String> (
                          width: screenMediaWidth*0.75,
                          inputDecorationTheme: inputDecorationTheme,
                          initialSelection: major.first,
                        onSelected: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                            dropdownMajor = '$dropdownValue';
                          });
                          },
                          dropdownMenuEntries: major.map    <DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(value: value, label: value);
                          }).toList(),
                        ),
                      ),
                      InputCreate(
                        ctllerText: _controllerYear,
                        title: 'ชั้นปี :',
                      ),
                      InputCreate(
                          ctllerText: _controllerAcademicYear,
                          title: 'ปีการศึกษา :',
                        ),
                      InputCreate(
                        ctllerText: _controllerIDCard,
                        title: 'เลขประจำตัวประชาชน :',
                      ),
                      InputCreate(
                        ctllerText: _controllerStuCard,
                        title: 'เลขประจำตัวนักศึกษา :',
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 20),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text("รายการที่ต้องการจดทะเบียนล่าช้า :",style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.019,color: Colors.black))),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 20,top: 15,bottom: 10),
                            child: DropdownMenu<String> (
                                width: screenMediaWidth*0.9,
                                inputDecorationTheme: inputDecorationTheme,
                                initialSelection: register.first,
                              onSelected: (String? value) {
                                setState(() {
                                  dropdownValue = value!;
                                  dropdownList = '$dropdownValue';
                                });
                                },
                                dropdownMenuEntries: register.map    <DropdownMenuEntry<String>>((String value) {
                                  return DropdownMenuEntry<String>(value: value, label: value);
                                }).toList(),
                              ),
                          ),
                        ],
                      ),
                      InputCreate(
                        ctllerText: _controllerNumber,
                        title: 'รหัสวิชา :',
                      ),
                      InputCreate(
                        ctllerText: _controllerSection,
                        title: 'section :',
                      ),
                      const SizedBox(height: 20,),
                      ButtonCreate(onClicked: () async {
                        final form = globalKey.currentState!;
                        final isValid = form.validate();
                        if (isValid) {
                          final userRegister = UserRegister(
                            title: dropdownTitle, 
                            thaiName: _controllerThaiName.text,
                            engName: _controllerEngName.text, 
                            dateOfBirth: _controllerDateOfBirth.text,
                            faculty: dropdownMajor, 
                            major: dropdownMajor, 
                            years: _controllerYear.text, 
                            academicyear: _controllerAcademicYear.text, 
                            idCard: _controllerIDCard.text, 
                            studentcard: _controllerStuCard.text, 
                            list: dropdownList,
                            number: _controllerNumber.text,
                            section: _controllerSection.text);
                          widget.onSaveUser(userRegister);
                        Navigator.of(context).popAndPushNamed('/homepage');
                        }
                      }),
                      const SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ])));
  }
}