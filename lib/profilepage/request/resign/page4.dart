import 'package:flutter/material.dart';

class FollowUpResignPage extends StatefulWidget {
  const FollowUpResignPage({super.key});

  @override
  State<FollowUpResignPage> createState() => _FollowUpPageState();
  
}

class _FollowUpPageState extends State<FollowUpResignPage> {
  @override
  Widget build(BuildContext context) {
    final screenMediaHeight = MediaQuery.of(context).size.height;
    final screenMediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ติดตามสถานะลาออก / ลาพักการศึกษา',style: TextStyle(fontSize: 19),maxLines: 2,),
      ),
      body: Row(
        children: [
          SizedBox(
            width: screenMediaWidth,
            child: Padding(
              padding: EdgeInsets.only(top: screenMediaHeight/7),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(241, 87, 68, 1),
                      Color.fromRGBO(255, 130, 91, 1)
                    ]),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(100))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/temp/เต๋า.png"),
                        const SizedBox(height: 40,),
                        Text('สามารถดูผลคำร้องได้ภายใน',style: TextStyle(fontSize: screenMediaHeight*0.022,color: Colors.white)),
                        const SizedBox(height: 20,),
                        Text('5 - 10 วันทำการ หลังจากส่งฟอร์ม',style: TextStyle(fontSize: screenMediaHeight*0.022,color: Colors.white),),
                        //Text('หลังจากส่งฟอร์ม',style: TextStyle(fontSize: screenMediaHeight*0.022,color: Colors.white),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ));
}
}