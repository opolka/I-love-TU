import 'package:flutter/material.dart';

class InformationFollowUpPage extends StatefulWidget {
  const InformationFollowUpPage({super.key});

  @override
  State<InformationFollowUpPage> createState() => _InformationFollowUpPage();
  
}

class _InformationFollowUpPage extends State<InformationFollowUpPage> {
  @override
  Widget build(BuildContext context) {
    final screenMediaHeight = MediaQuery.of(context).size.height;
    final screenMediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ติดตามสถานะลาออก / ลาพักการศึกษา',maxLines: 2,style: TextStyle(fontSize: 19),),
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
                        Text('จะได้รับเอกสารอิเล็กทรอนิกส์ส่งไปที่\nemail ของมหาวิทยาลัย',style: TextStyle(fontSize: screenMediaHeight*0.022,color: Colors.white),textAlign: TextAlign.center,),
                        const SizedBox(height: 20,),
                        Text('ภายใน 5 - 10 วันทำการ',style: TextStyle(fontSize: screenMediaHeight*0.022,color: Colors.white),),
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