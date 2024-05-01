import 'package:flutter/material.dart';

class InputMultiCreate extends StatefulWidget {
  final String title;
  final TextEditingController ctllerText;

  const InputMultiCreate({
    Key? key,
    required this.title,
    required this.ctllerText,
  }) : super(key: key);

  @override
  State<InputMultiCreate> createState() => _InputMultiCreateState();
}

class _InputMultiCreateState extends State<InputMultiCreate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(widget.title,style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.019,color: Colors.black))),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 20,top: 15),
          child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            controller: widget.ctllerText,
            maxLines: 5,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.63)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.63))),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.63))),
                filled: true,
                fillColor: Color.fromRGBO(255, 255, 255, 0.63),
              ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'กรุณาใส่ข้อมูลให้ครบถ้วน';
              }
              //if (value.contains('@')) {
              return null;
            },
          ),
                ),
        ),
      ],
    );
  }
}
