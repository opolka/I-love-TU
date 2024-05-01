import 'package:flutter/material.dart';

class InputCreate extends StatefulWidget {
  final String title;
  final TextEditingController ctllerText;

  const InputCreate({
    Key? key,
    required this.title,
    required this.ctllerText,
  }) : super(key: key);

  @override
  State<InputCreate> createState() => _InputCreateState();
}

class _InputCreateState extends State<InputCreate> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(widget.title,style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.019,color: Colors.black)),
      title: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: widget.ctllerText,
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
    );
  }
}
