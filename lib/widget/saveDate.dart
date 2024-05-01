import 'package:flutter/material.dart';

class InputDateCreate extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController ctllerText;

  const InputDateCreate({
    Key? key,
    required this.title,
    required this.hintText,
    required this.ctllerText,
  }) : super(key: key);

  @override
  State<InputDateCreate> createState() => _InputDateCreateState();
}

class _InputDateCreateState extends State<InputDateCreate> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(widget.title,style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.019,color: Colors.black)),
      title: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: widget.ctllerText,
          decoration: InputDecoration(
            hintText: widget.hintText,
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
    );
  }
}
