import 'package:flutter/material.dart';
import 'package:i_love_tu/app_colors.dart';
import 'package:i_love_tu/profilepage/request/resign/page4.dart';
import 'package:i_love_tu/services/SavePage/absenceSave.dart';
import 'package:i_love_tu/services/SavePage/resignSave.dart';

class FormRequestResign extends StatefulWidget {
  const FormRequestResign({super.key});

  @override
  State<FormRequestResign> createState() => _FormRequestResign();
}

class _FormRequestResign extends State<FormRequestResign> {

  @override
  Widget build(BuildContext context) {
    final screenMediaHeight = MediaQuery.of(context).size.height;
    final screenMediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('คำร้องลาออก / ลาพักการศึกษา',style: TextStyle(fontSize: screenMediaHeight*0.025,fontWeight: FontWeight.w600),),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResignSaveForm()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.btn_orange,
                        ), 
                        child: Text('ลาออก',style: TextStyle(fontSize: screenMediaHeight*0.026,color: Colors.white),),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: screenMediaWidth,
                      height: screenMediaHeight/15,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const AbsenceSaveForm()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.btn_orange
                        ), 
                        child: Text('ลาพักการศึกษา',style: TextStyle(fontSize: screenMediaHeight*0.026,color: Colors.white),),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: screenMediaWidth,
                      height: screenMediaHeight/15,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const FollowUpResignPage()));
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
              width: screenMediaWidth/1.15,
              height: screenMediaHeight/12,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
              ),
              child: Center(
                child: Text('คำร้องลาออก / ลาพักการศึกษา',style: TextStyle(fontSize: screenMediaHeight*0.026,color: Colors.black),),
              ),
            ),
          ),
      ],
      )
    );
  }
}