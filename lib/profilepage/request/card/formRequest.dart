import 'package:flutter/material.dart';
import 'package:i_love_tu/app_colors.dart';
import 'package:i_love_tu/profilepage/request/card/follow_up.dart';
import 'package:i_love_tu/services/SavePage/cardLostSave.dart';
import 'package:i_love_tu/services/SavePage/newCardSave.dart';

class FormRequest extends StatefulWidget {
  const FormRequest({super.key});

  @override
  State<FormRequest> createState() => _StudentIDChange();
}

class _StudentIDChange extends State<FormRequest> {

  @override
  Widget build(BuildContext context) {
    final screenMediaHeight = MediaQuery.of(context).size.height;
    final screenMediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Request',style: TextStyle(fontSize: screenMediaHeight*0.025,fontWeight: FontWeight.w600),),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenMediaHeight/10),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
              child: Image.asset('assets/temp/form.png',fit: BoxFit.fill,color: Colors.black.withOpacity(0.6),colorBlendMode: BlendMode.darken,),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: screenMediaHeight/3),
            child: Container(
              width: screenMediaWidth,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50)
                  )
                ),
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenMediaWidth,
                      height: screenMediaHeight/15,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const NewCardSaveForm()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.btn_orange,
                        ), 
                        child: Text('สำหรับนักศึกษาใหม่',style: TextStyle(fontSize: screenMediaHeight*0.026,color: Colors.white),),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: screenMediaWidth,
                      height: screenMediaHeight/15,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const CardLostSaveForm()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.btn_orange
                        ), 
                        child: Text('กรณี สูญหาย / ชำรุด',style: TextStyle(fontSize: screenMediaHeight*0.026,color: Colors.white),),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: screenMediaWidth,
                      height: screenMediaHeight/15,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const FollowUpPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.btn_orange
                        ), 
                        child: Text('ติดตามสถานะ',style: TextStyle(fontSize: screenMediaHeight*0.026,color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(top: screenMediaHeight/3.3),
              width: screenMediaWidth/1.5,
              height: screenMediaHeight/12,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
              ),
              child: Center(
                child: Text('คำร้องทำบัตรนักศึกษา',style: TextStyle(fontSize: screenMediaHeight*0.026,color: Colors.black),),
              ),
            ),
          ),
      ],
      )
    );
  }
}