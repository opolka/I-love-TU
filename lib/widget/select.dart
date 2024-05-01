import 'package:flutter/material.dart';

Widget selectType(dynamic type,double screenMediaHeight, String text, String hintText){
  return ListTile(
    leading: Text(text,style: TextStyle(fontSize: screenMediaHeight*0.023,color: Colors.black)),
    title: DropdownButtonFormField(
    decoration: const InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 20),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.63)),
      borderRadius: BorderRadius.all(Radius.circular(20),),
      ), 
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.63)),
      borderRadius: BorderRadius.all(Radius.circular(20),),
      ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.63)),
      borderRadius: BorderRadius.all(Radius.circular(20),),
      ),
      filled: true,
      fillColor: Color.fromRGBO(255, 255, 255, 0.63),
    ),
    hint: Text(hintText,style: TextStyle(fontSize: screenMediaHeight*0.02),),
    items: type.items.map<DropdownMenuItem<String>>((String items) { 
      return DropdownMenuItem( 
        value: items, 
        child: Text(items), 
            ); 
            }
        ).toList(), 
        onChanged: (String? newValue) {  
          setState(() { 
            type.dropdownvalue = newValue!; 
            },
          );                             
        },
      )
  );
}

void setState(Null Function() param0) {
}