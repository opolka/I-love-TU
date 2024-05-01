// import 'package:flutter/material.dart';

// Widget typeTextMultiple(double screenMediaHeight, String text){
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 5),
//           child: Text(text,style: TextStyle(fontSize: screenMediaHeight*0.02,color: Colors.black),),
//         ),
//         const ListTile(
//           title: TextField(
//           maxLines: 5,
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(horizontal: 20),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.63)),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.63))),
//             filled: true,
//             fillColor: Color.fromRGBO(255, 255, 255, 0.63),
//                 ),
//               ),
//         ),
//       ],
//     );
//   }