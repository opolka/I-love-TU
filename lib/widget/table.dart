import 'package:flutter/material.dart';
/// Flutter code sample for [Table].

class TableExampleApp extends StatelessWidget {
  const TableExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body:  SingleChildScrollView(
            child: Stack(children: <Widget>[
              Padding(padding: EdgeInsets.only(right: 15,left: 15,top: 300,bottom: 0)),
               TableExample(),

            Padding(padding: EdgeInsets.only(right: 15,left: 15,top: 200,bottom: 0)),
            Text("Subject",
            style: TextStyle(
              fontSize: 30
            ),)

            ],
      


      ),
    ));
  }
}

class TableExample extends StatelessWidget {
  const TableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Table(
      
       border:TableBorder.all(color: Colors.black54,borderRadius: BorderRadius.circular(15)),
        columnWidths: const {0: FixedColumnWidth(70),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: const [
          TableRow(children: [
            Column(
              children: [Text("")],
            ),
            Column(
              children: [
                Text(
                  "8:00",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "9:30",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "11:00",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "12:00",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "14:00",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "15:30",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "17:00",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "18:30",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "20:00",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ]),
          TableRow(children: [
            Column(
              children: [
                Text(
                  "Monday",
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
          ]),
          TableRow(children: [
            Column(
              children: [
                Text(
                  "Tuesday",
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
          ]),
          TableRow(children: [
            Column(
              children: [
                Text(
                  "Wendesday",
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
          ]),
          TableRow(children: [
            Column(
              children: [
                Text(
                  "Thursday",
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
          ]),
          TableRow(children: [
            Column(
              children: [
                Text(
                  "Friday",
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
          ]),
          TableRow(children: [
            Column(
              children: [
                Text(
                  "Sathurday",
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
          ]),
          TableRow(children: [
            Column(
              children: [
                Text(
                  "Sunday",
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
            Column(
              children: [Text("")],
            ),
          ]),
        ]);
  }
}
