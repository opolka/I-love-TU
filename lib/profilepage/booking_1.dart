
import 'package:i_love_tu/services/database_service.dart';
import 'package:i_love_tu/model/icon_booking.dart';
import 'package:i_love_tu/model/krom_luang.dart';
import 'package:i_love_tu/model/student_data.dart';
import 'package:i_love_tu/profilepage/booking_last.dart';
import 'package:i_love_tu/app_colors.dart';
import 'package:flutter/material.dart';

class Booking1 extends StatefulWidget {
  final Students user;
  const Booking1({super.key, required this.user});

  @override
  State<Booking1> createState() => _Booking1State();
}

class _Booking1State extends State<Booking1> {
  final DatabaseService _databaseService = DatabaseService();
  int? selectedTime;
  KromLuangRoom? selectedRoom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking',
          style: TextStyle(
            fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        leading: const Padding(padding: EdgeInsets.only(left: 20),
        child: BackButton())
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Container(
                  height: MediaQuery.of(context).size.height/1.15,
                  decoration: const BoxDecoration(
                    gradient: AppColors.gradient,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(130))
                  ),
                )
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(20),
            alignment: Alignment.topRight,
            child: Text("Krom Luang Naradhiwas\nRajanagarinda Leraning Centre ",
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width/30,
                fontWeight: FontWeight.bold,
                color: Colors.white),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 60,),
                child: FutureBuilder<List<KromLuangRoom>>(
                  future: _databaseService.kromluangroom(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    final rooms = snapshot.data ?? [];
                    return Column(
                      children: [
                        for (var room in rooms)
                          for (int i = 0; i < 2; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              child: buildRoomMenu(context, room, i),
                            ),
                      ],
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
    
  }

  Widget buildRoomMenu(BuildContext context, KromLuangRoom room, int i) {
    final String number = (i+1).toString();
  return MaterialButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return popupSelectTime(context, room,number);
        },
      );
    },
    child: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black,
          ),
        ),
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage('assets/images/${room.imageURL}.jpg'),fit: BoxFit.cover)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${room.typeRoom} #${i + 1}',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 26,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Status : Available',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 40,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3, left: 3),
                              child: Icon(
                                Icons.circle,
                                size: MediaQuery.of(context).size.width / 60,
                                color: Colors.green,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Floor : ${room.floorNo}',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 40,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.people,
                        size: MediaQuery.of(context).size.width / 15,
                        color: const Color.fromRGBO(255, 130, 91, 1),
                      ),
                      Text(
                        '${room.numPeople} people',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width / 40,
                        ),
                      ),
                    ],
                  ),
                  
                  for (var support in room.support.split(','))
                    Column(
                      children: [
                        selectIconForSupport(support, context, AppColors.orange,15),
                        Text(
                          support,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width / 40,
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


  Widget popupSelectTime(BuildContext context, KromLuangRoom room,String number) {
    return AlertDialog(
                title: const Center(
                  child: Text('Choose Time')),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioListTile<int>(
                      title: const Text('9:00 - 12:00'),
                      value: 0,
                      groupValue: selectedTime,
                      onChanged: (value) {
                        setState(() {
                          selectedTime = value;
                        });
                      },
                    ),
                    RadioListTile<int>(
                      title: const Text('12:00 - 15:00'),
                      value: 1,
                      groupValue: selectedTime,
                      onChanged: (value) {
                        setState(() {
                          selectedTime = value;
                        });
                      },
                    ),
                    RadioListTile<int>(
                      title: const Text('15:00 - 18:00'),
                      value: 2,
                      groupValue: selectedTime,
                      onChanged: (value) {
                        setState(() {
                          selectedTime = value;
                        });
                      },
                    ),
                    RadioListTile<int>(
                      title: const Text('18:00 - 21:00'),
                      value: 3,
                      groupValue: selectedTime,
                      onChanged: (value) {
                        setState(() {
                          selectedTime = value;
                        });
                      },
                    ),
                    RadioListTile<int>(
                      title: const Text('21:00 - 23:00'),
                      value: 4,
                      groupValue: selectedTime,
                      onChanged: (value) {
                        setState(() {
                          selectedTime = value;
                        });
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => LastBooking(user: widget.user, selectedRoom: room, selectedTime: selectedTime!, selectedNumber: number))));
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            }
          
  
}
