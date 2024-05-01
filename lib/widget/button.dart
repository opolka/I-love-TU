import 'package:flutter/material.dart';
import 'package:i_love_tu/app_colors.dart';

class ButtonCreate extends StatelessWidget {
  final VoidCallback onClicked;

  const ButtonCreate({
    Key? key, 
    required this.onClicked})
    : super(key: key);
  

  @override
  Widget build(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width/2,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.orange,
      ),
      onPressed: onClicked,
      child: Text('Submit', 
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height*0.02,color: Colors.white,fontWeight: FontWeight.w600
        ),),
    ),
  );
}
}
