import 'package:flutter/material.dart';
class FollowUpPage extends StatefulWidget {
  const FollowUpPage({super.key});

  @override
  State<FollowUpPage> createState() => _FollowUpPageState();
  
}

class _FollowUpPageState extends State<FollowUpPage> {
  @override
  Widget build(BuildContext context) {
    final screenMediaHeight = MediaQuery.of(context).size.height;
    final screenMediaWidth = MediaQuery.of(context).size.width;
    // DateTime currentDate = DateTime.now();
    // DateTime futureDate = currentDate.add(Duration(days: 5));
    // DateTime anotherFutureDate = currentDate.add(Duration(days: 10));
    // String formattedCurrentDate = DateFormat('yyyy-MM-dd').format(currentDate);
    // String formattedFutureDate = DateFormat('yyyy-MM-dd').format(futureDate);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ติดตามสถานะการขอหลักฐานการศึกษา',style: TextStyle(fontSize: 19),maxLines: 2,),
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
                        Image.asset("assets/temp/เต๋า-2.png"),
              //           Text('Current Date: ${currentDate.toString()}'),
              //           Text('Date after adding 5 days: ${futureDate.toString()}'),
              //           Text('Current Date: $formattedCurrentDate'),
              //           Text('Date after adding 5 days: $formattedFutureDate'),
                        const SizedBox(height: 40,),
                        Text('รับบัตรนักศึกษาภายใน',style: TextStyle(fontSize: screenMediaHeight*0.022,color: Colors.white)),
                        Text('5 - 10 วันทำการ',style: TextStyle(fontSize: screenMediaHeight*0.022,color: Colors.white)),
                        const SizedBox(height: 20,),
                        //Text('วันที่ 01/03/2565',style: TextStyle(fontSize: screenMediaHeight*0.022,color: Colors.white),),
                        Text('*สามารถรับบัตรได้ที่ ธนาคารกรุงเทพ',style: TextStyle(fontSize: screenMediaHeight*0.022,color: Colors.white),),
                        Text('ณ สาขาที่ระบุในระบบ เท่านั้น',style: TextStyle(fontSize: screenMediaHeight*0.022,color: Colors.white),)
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