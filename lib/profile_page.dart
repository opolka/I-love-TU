import 'package:i_love_tu/model/student_data.dart';
import 'package:i_love_tu/profilepage/payment.dart';
import 'package:i_love_tu/profilepage/class_page.dart';
import 'package:i_love_tu/profilepage/contact_page.dart';
import 'package:i_love_tu/profilepage/examination_page.dart';
import 'package:i_love_tu/profilepage/gradelist_page.dart';
import 'package:i_love_tu/profilepage/notifications_page.dart';
import 'package:i_love_tu/profilepage/online_request_page.dart';
import 'package:i_love_tu/profilepage/registerationresult.dart';
import 'package:i_love_tu/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:i_love_tu/profilepage/registeration_page.dart';
import 'package:i_love_tu/login_page.dart';
class ProfilePage extends StatefulWidget {
  final Students user;

  const ProfilePage({super.key, required this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    final screenMediaHeight = MediaQuery.of(context).size.height;
    final screenMediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 200,
        flexibleSpace: getAppBottomView(screenMediaHeight,screenMediaWidth)
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            elevatebtn(screenMediaHeight,screenMediaWidth,"Class","class",ClassPage(user: widget.user,)),
            elevatebtn(screenMediaHeight,screenMediaWidth,"Examination","exam", ExaminationPage(user: widget.user)),
            elevatebtn(screenMediaHeight,screenMediaWidth,"Registration","regis", RegisterationPage(user: widget.user)),
            elevatebtn(screenMediaHeight,screenMediaWidth,"Registration Result","regisCheck", RegisterationResultPage(user: widget.user)),
            elevatebtn(screenMediaHeight,screenMediaWidth,"Grade List","grade", GradeListPage(user: widget.user)),
            elevatebtn(screenMediaHeight,screenMediaWidth,"Online Request","request", MyOnlineRequestPage(user: widget.user)),
            elevatebtn(screenMediaHeight,screenMediaWidth,"Contact","contact", ContactPage(user: widget.user)),
            elevatebtn(screenMediaHeight,screenMediaWidth,"Payment List","payment",PaymentPage(user: widget.user)),
            elevatebtn(screenMediaHeight,screenMediaWidth,"Notification","noti",const NotificationsPage()),
            logOutbtn(screenMediaHeight,screenMediaWidth,"Logout","logout"),
        ]),
      ),
    );
  }

  Widget getAppBottomView(double screenMediaHeight, double screenMediaWidth) {
    return Stack(
      children: [
        Image.asset('assets/temp/pic_profile.png',
          fit: BoxFit.fill,
          height: screenMediaHeight/7,
          width: screenMediaWidth,),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenMediaHeight*0.09,right: 10,left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenMediaWidth*0.5,
                        padding: EdgeInsets.only(bottom: screenMediaHeight*0.01),
                        child: Text('${widget.user.firstName} ${widget.user.lastName}',
                          style: TextStyle(
                              fontSize: screenMediaHeight*0.025,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                              shadows: const [ Shadow(
                                blurRadius: 10,
                                color: Colors.black
                              )]
                            ),
                          ),
                        ),
                      Container(
                        child: box(screenMediaWidth),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: CircleAvatar(
                      radius: screenMediaWidth*0.13,
                      backgroundColor: Colors.white,
                      child: widget.user.imageURL.isEmpty
                        ? Icon(Icons.account_circle_rounded,
                          size: screenMediaWidth*0.25,
                          color: Colors.white
                          )
                        : CircleAvatar(
                          backgroundImage: AssetImage('assets/userImage/${widget.user.imageURL}.JPG'),
                          radius: screenMediaWidth*0.12)
                      //Icon(Icons.account_circle_rounded,size: screenMediaWidth*0.25,color: Colors.black38,),
                    ),
                  )
                ],        
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Spacer(),
                Column(
                  children: [
                  Text(widget.user.studentID,
                  style: TextStyle(
                    fontSize: screenMediaHeight/55,
                    fontWeight: FontWeight.w600)),
                  Text('รหัสนักศึกษา',
                  style: TextStyle(
                    fontSize: screenMediaHeight/70,
                    fontFamily: 'IBM Plex Sans'))
                  ],
                ),
                const Spacer(),
                const SizedBox(
                  height: 40,
                  child: VerticalDivider(
                    color: Colors.black26,
                    thickness: 2,
                    indent: 5,
                    endIndent: 5,
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                  Text('${widget.user.grade}',
                  style: TextStyle(
                    fontSize: screenMediaHeight/55,
                    fontWeight: FontWeight.w600)),
                  Text('เกรดเฉลี่ยสะสม',
                  style: TextStyle(
                    fontSize: screenMediaHeight/70,
                    fontFamily: 'IBM Plex Sans'))
                  ],
                ),
                const Spacer(),
                const SizedBox(
                  height: 40,
                  child: VerticalDivider(
                    color: Colors.black26,
                    thickness: 2,
                    indent: 5,
                    endIndent: 5,
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                  Text('${widget.user.credit}',
                  style: TextStyle(
                    fontSize: screenMediaHeight/55,
                    fontWeight: FontWeight.w600)),
                  Text('หน่วยกิตสะสม',
                  style: TextStyle(
                    fontSize: screenMediaHeight/70,
                    fontFamily: 'IBM Plex Sans'))
                  ],
                ),
                const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ]
    );
  }

  Widget box(double screenMediaWidth) {
    return Container(
      //width: screenMediaWidth*0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
            color: AppColors.gray
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.school_rounded,size: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("${widget.user.major}\n${widget.user.faculty}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold)),
              ),
              ]
            ),
        )       
    );
  }
  
  Widget elevatebtn(double screenMediaHeight, double screenMediaWidth,String name,String iconName,Widget pageName){
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 30),
            child: SizedBox(
              width: screenMediaWidth,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>pageName));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  backgroundColor: Colors.white,
                  elevation: 3
                  
                ),
                child: Row(
                  children: [
                    getIconName(iconName,Colors.black),
                    SizedBox(width: screenMediaWidth*0.05,height: screenMediaHeight*0.05),
                    Text(name,style: TextStyle(fontSize: screenMediaHeight/55,fontWeight: FontWeight.w500,color: Colors.black)),
                    const Spacer(),
                    const Icon(Icons.navigate_next_rounded,color: Colors.black)
                  ],
                )
              ),
            ),
          ),
        ],
    );
  }
  Widget logOutbtn(double screenMediaHeight, double screenMediaWidth,String name,String iconName){
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 30),
            child: SizedBox(
              width: screenMediaWidth,
              child: ElevatedButton(
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return popUpLogout(context);
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  backgroundColor: Colors.white,
                  elevation: 3
                  
                ),
                child: Row(
                  children: [
                    getIconName(iconName,Colors.black),
                    SizedBox(width: screenMediaWidth*0.05,height: screenMediaHeight*0.05),
                    Text(name,style: TextStyle(fontSize: screenMediaHeight/55,fontWeight: FontWeight.w500,color: Colors.black)),
                    const Spacer(),
                    const Icon(Icons.navigate_next_rounded,color: Colors.black)
                  ],
                )
              ),
            ),
          ),
        ],
    );
  }
}

Widget popUpLogout(BuildContext context) {
  return AlertDialog(
    title: const Center(child: Text('Log out')),
    content: const Text('Are you sure you want to logout?'),
    actions: 
    [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.black,),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextButton(onPressed: () {
                  Navigator.of(context).pop();
                }, 
                child: const Text('Cancel',
                style: TextStyle(color: Colors.white))),
              ),
            ),
          
          Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: AppColors.deepOrange,),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextButton(onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                }, 
                child: const Text('Logout',
                style: TextStyle(color: Colors.white),)),
              ),
            ),
          
        ],

      )

    ],
    
  );
}

Icon getIconName(String iconName ,Color color) {
  Map<String,IconData> iconMap = {
    'class' : Icons.co_present_outlined,
    'exam' : Icons.subject_rounded,
    'regis' : Icons.app_registration_rounded,
    'regisCheck ' : Icons.fact_check_outlined,
    'grade' : Icons.abc_rounded,
    'request' : Icons.edit_note_rounded,
    'contact' : Icons.phone,
    'payment' : Icons.payment_rounded,
    'noti' : Icons.notifications_active_outlined,
    'setting' : Icons.settings_rounded,
    'logout' : Icons.logout_rounded
  };
  IconData selectedIcon = iconMap[iconName] ?? Icons.error;
  return Icon(selectedIcon, color: color);
}