import 'package:i_love_tu/bottom_nav_bar.dart';
import 'package:i_love_tu/services/database_service.dart';
import 'package:i_love_tu/model/student_data.dart';
import 'package:i_love_tu/app_colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  bool isHidden = true;
  final TextEditingController studentid = TextEditingController();
  final TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isLoginTrue = false;

  final db = DatabaseService();

  Students? loggedInUser;

  Future<void> login() async {
    final studentID = studentid.text;
    //  studentid.text;
    final idNumber = password.text;
    //  password.text;

    final response = await db.login(studentID, idNumber);
    if (response) {
      // Login success
      final userData = Students.fromMap(await db.getUserDatass(studentID));
      setState(() {
        loggedInUser = userData; // กำหนดค่าของ loggedInUser เมื่อ login สำเร็จ
      });

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyButtomNavBar(user: loggedInUser!,index:0)),
      );
    } else {
      // Login failed
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenMediaHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        backgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SizedBox(
              height: screenMediaHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Text("Hello,",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenMediaHeight * 0.05)),
                              Text("Welcome back",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenMediaHeight * 0.04)),
                              const SizedBox(
                                height: 20,
                              ),
                              inputStudentID(screenMediaHeight),
                              const SizedBox(
                                height: 15,
                              ),
                              inputPassword(screenMediaHeight),
                              const SizedBox(
                                height: 10,
                              ),
                              alertLogin(screenMediaHeight),
                              forgotPass(screenMediaHeight),
                              buildRememberCB(screenMediaHeight),
                              const SizedBox(
                                height: 10,
                              ),
                              loginBtn(screenMediaHeight),
                              const SizedBox(
                                height: 15,
                              ),
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget alertLogin(double screenMediaHeight) {
    return isLoginTrue
        ? Center(
            child: Text(
              '** Student ID or password is incorrect **',
              style: TextStyle(
                  color: AppColors.deepOrange,
                  fontSize: screenMediaHeight / 80),
            ),
          )
        : const SizedBox();
  }

  Widget inputStudentID(double screenMediaHeight) {
    return TextFormField(
        controller: studentid,
        validator: (value) {
          if (value!.isEmpty) {
            return "Student ID is required";
          }
          return null;
        },
        decoration: InputDecoration(
          //borderRadius: BorderRadius.all(Radius.circular(40)),
          contentPadding: EdgeInsets.symmetric(
              horizontal: 30, vertical: screenMediaHeight * 0.015),
          isDense: true,
          hintText: 'Student ID',
          hintStyle: TextStyle(fontSize: screenMediaHeight * 0.02),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            borderSide: BorderSide(color: Color.fromRGBO(230, 230, 230, 0.7)),
          ),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              borderSide: BorderSide(color: Color.fromRGBO(230, 230, 230, 70))),
          //   errorBorder: const OutlineInputBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(40)),
          //     borderSide: BorderSide(color: AppColors.deepOrange),
          //   ),
          //   disabledBorder: const OutlineInputBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(40)),
          //     borderSide: BorderSide(color: Color.fromRGBO(230, 230, 230, 70))
          //   ),
          // errorStyle: const TextStyle(color: AppColors.deepOrange),
          filled: true,
          fillColor: const Color.fromRGBO(230, 230, 230, 70),
        ));
  }

  Widget inputPassword(double screenMediaHeight) {
    return TextFormField(
      controller: password,
      validator: (value) {
        if (value!.isEmpty) {
          return "Password is required";
        }
        return null;
      },
      obscureText: isHidden,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: 30, vertical: screenMediaHeight * 0.015),
        isDense: true,
        hintText: 'Password',
        hintStyle: TextStyle(fontSize: screenMediaHeight * 0.02),
        suffixIcon: IconButton(
          icon: isHidden
              ? const Icon(Icons.visibility_off,
                  color: Color.fromRGBO(99, 104, 107, 1))
              : const Icon(Icons.visibility,
                  color: Color.fromRGBO(99, 104, 107, 1)),
          onPressed: () {
            setState(() {
              isHidden = !isHidden;
            });
          },
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(color: Color.fromRGBO(230, 230, 230, 0.7)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(color: Color.fromRGBO(230, 230, 230, 0.7)),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(color: AppColors.deepOrange),
        ),
        errorStyle: const TextStyle(color: AppColors.deepOrange),
        filled: true,
        fillColor: const Color.fromRGBO(230, 230, 230, 70),
      ),
    );
  }

  Widget forgotPass(double screenMediaHeight) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            foregroundColor: const Color.fromRGBO(135, 135, 135, 1)),
        child: Text('Forgot Password',
            style: TextStyle(
                fontSize: screenMediaHeight * 0.017,
                decoration: TextDecoration.underline,
                decorationColor: const Color.fromRGBO(135, 135, 135, 1))),
      ),
    );
  }

  Widget buildRememberCB(double screenMediaHeight) {
    return Row(
      children: [
        Theme(
            data: ThemeData(unselectedWidgetColor: Colors.black12),
            child: Checkbox(
              value: rememberMe,
              checkColor: Colors.white,
              activeColor: AppColors.orange,
              side: const BorderSide(color: Color.fromRGBO(99, 104, 107, 1)),
              onChanged: (value) {
                setState(() {
                  rememberMe = value!;
                });
              },
            )),
        Text('Remember Me',
            style: TextStyle(
                color: const Color.fromRGBO(99, 104, 107, 1),
                fontSize: screenMediaHeight * 0.018)),
      ],
    );
  }

  Widget loginBtn(double screenMediaHeight) {
    return Column(children: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: screenMediaHeight * 0.065,
        child: ElevatedButton(
            onPressed: () {
              login();
            },
            style:
                ElevatedButton.styleFrom(backgroundColor: AppColors.deepOrange),
            child: Text(
              "Login",
              style: TextStyle(
                  fontSize: screenMediaHeight * 0.025,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
      )
    ]);
  }

  Widget backgroundImage() {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/temp/PUEY UNGPHAKORN CENTENARY HALL, THAMMASAT UNIVERSITY - Arsomsilp 1.png'),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
    );
  }
}
