import 'dart:developer';
import 'package:i_love_tu/model/booking.dart';
import 'package:i_love_tu/profilepage/mybooking_page.dart';
import 'package:i_love_tu/services/database_service.dart';
import 'package:i_love_tu/model/icon_booking.dart';
import 'package:i_love_tu/model/krom_luang.dart';
import 'package:i_love_tu/model/puey.dart';
import 'package:i_love_tu/model/student_data.dart';
import 'package:i_love_tu/profilepage/booking_complete.dart';
import 'package:i_love_tu/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class LastBooking<T> extends StatefulWidget {
  final T selectedRoom;
  final int? selectedTime;
  final String selectedNumber;
  final Students user;

  const LastBooking(
      {Key? key,
      required this.selectedRoom,
      this.selectedTime,
      required this.selectedNumber,
      required this.user});

  @override
  State<LastBooking<T>> createState() => _LastBookingState();
}

class _LastBookingState<T> extends State<LastBooking<T>> {
  late T selectedRoom;
  late String selectedNumber;
  bool isFinished = false;

  Future<void> _insertBooking() async {
    final booking = Booking(
      userID:
          '6510742221', // You need to set this userID value according to your authentication logic
      roomBuilding: getBuildingName(),
      roomType: getTypeRoom(),
      roomNumber: selectedNumber,
      time: getSelectedTime(),
    );
    log("insert line 46");
/*
     final booking = Booking(
      userID:
          '6510742221', // You need to set this userID value according to your authentication logic
      roomBuilding: getBuildingName(),
      roomType: getTypeRoom(),
      roomNumber: selectedNumber,
      time: getSelectedTime(),
    );
    log("insert line 46");
  */
    await DatabaseService().insertBookingFromLastBooking(booking);
  }

  @override
  void initState() {
    super.initState();
    selectedRoom = widget
        .selectedRoom; // เก็บข้อมูลห้องที่เลือกจาก widget ไว้ในตัวแปร selectedRoom
    selectedNumber = widget.selectedNumber;
  }

  String getTypeRoom() {
    if (selectedRoom is KromLuangRoom) {
      return (selectedRoom as KromLuangRoom).typeRoom;
    } else if (selectedRoom is PueyUngphakorn) {
      return (selectedRoom as PueyUngphakorn).typeRoom;
    } else {
      return '';
    }
  }

  String getBuildingName() {
    if (selectedRoom is KromLuangRoom) {
      return (selectedRoom as KromLuangRoom).building;
    } else if (selectedRoom is PueyUngphakorn) {
      return (selectedRoom as PueyUngphakorn).building;
    } else {
      return '';
    }
  }

  String getFloorNumber() {
    if (selectedRoom is KromLuangRoom) {
      return (selectedRoom as KromLuangRoom).floorNo;
    } else if (selectedRoom is PueyUngphakorn) {
      return (selectedRoom as PueyUngphakorn).floorNo;
    } else {
      return '';
    }
  }

  String getNumPeople() {
    if (selectedRoom is KromLuangRoom) {
      return (selectedRoom as KromLuangRoom).numPeople;
    } else if (selectedRoom is PueyUngphakorn) {
      return (selectedRoom as PueyUngphakorn).numPeople;
    } else {
      return '';
    }
  }

  int getNumCheck() {
    if (selectedRoom is KromLuangRoom) {
      return (selectedRoom as KromLuangRoom).numCheck;
    } else if (selectedRoom is PueyUngphakorn) {
      return (selectedRoom as PueyUngphakorn).numCheck;
    } else {
      return 0;
    }
  }

  List<String> getSupport() {
    if (selectedRoom is KromLuangRoom) {
      return (selectedRoom as KromLuangRoom).support.split(',');
    } else if (selectedRoom is PueyUngphakorn) {
      return (selectedRoom as PueyUngphakorn).support.split(',');
    } else {
      return [];
    }
  }

   String getImage() {
    if (selectedRoom is KromLuangRoom) {
      return (selectedRoom as KromLuangRoom).imageURL;
    } else if (selectedRoom is PueyUngphakorn) {
      return (selectedRoom as PueyUngphakorn).imageURL;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Booking',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            leading: const Padding(
                padding: EdgeInsets.only(left: 20), child: BackButton())),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Stack(children: [
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 7),
                alignment: Alignment.bottomLeft,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(100)),
                    gradient: AppColors.gradient),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 7),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          height: MediaQuery.of(context).size.height / 4.5,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(100)),
                              image: DecorationImage(
                                image: AssetImage('assets/images/${getImage()}.jpg'),
                                fit: BoxFit.cover)
                              ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width / 10,
                              left: MediaQuery.of(context).size.width / 7,
                              right: MediaQuery.of(context).size.width / 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: Text(getBuildingName(),
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                45,
                                        color: Colors.white)),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Floor: ${getFloorNumber()}',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              50,
                                          color: Colors.white)),
                                  Text('Time: ${getSelectedTime()}',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              45,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600)),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.width / 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.people,
                                      size: MediaQuery.of(context).size.width /
                                          18,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '${getNumPeople()} people',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                45,
                                      ),
                                    ),
                                  ],
                                ),
                                for (var support in getSupport())
                                  Column(
                                    children: [
                                      selectIconForSupport(
                                          support, context, Colors.white, 20),
                                      Text(
                                        support,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              45,
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                        for (int i = 0; i < getNumCheck(); i++)
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width / 10,
                                  vertical:
                                      MediaQuery.of(context).size.height / 170),
                              child: (i == 0)
                                  ? buildFieldText('Host Student ID',
                                      const Color.fromRGBO(255, 170, 143, 1), i)
                                  : buildFieldText(
                                      'Student ID N.${i + 1}',
                                      const Color.fromRGBO(255, 225, 217, 1),
                                      i)),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 6,
                    left: MediaQuery.of(context).size.width / 7),
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 12,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50)),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          '${getTypeRoom()} #$selectedNumber',
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 30,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 1.5,
                    right: MediaQuery.of(context).size.width / 7),
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 10,
                      vertical: MediaQuery.of(context).size.height / 20),
                  child: buildSwipeButton(),
                ),
              )
            ]),
          ),
        ));
  }

  Widget buildFieldText(String text, Color colorSelect, int i) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width / 40,
            ),
          ),
        ),
        Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 23,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              color: colorSelect,
            ),
            child: (i == 0)
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '651074xxxx',
                      style: TextStyle(color: Color.fromRGBO(136, 114, 107, 1)),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: TextField(
                      //keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                      ),
                    ),
                  ))
      ],
    );
  }

  Widget buildSwipeButton() {
    return SwipeableButtonView(
      onFinish: () async {
        await Navigator.push(
            context,
            PageTransition(
                child: MyBooking(user: widget.user),
                type: PageTransitionType.fade));
        setState(() => isFinished = false);
      },
      onWaitingProcess: () {
        _insertBooking();
        Future.delayed(const Duration(seconds: 2),
            () => setState(() => isFinished = true));
      },
      isFinished: isFinished,
      activeColor: const Color.fromRGBO(241, 87, 68, 1),
      buttonWidget: const Icon(Icons.arrow_forward_ios_rounded,
          color: Color.fromRGBO(241, 87, 68, 1)),
      buttonText: 'Booking Now',
      buttontextstyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
      buttonColor: Colors.black,
    );
  }

  String getSelectedTime() {
    switch (widget.selectedTime) {
      case 0:
        return '9:00 - 12:00';
      case 1:
        return '12:00 - 15:00';
      case 2:
        return '15:00 - 18:00';
      case 3:
        return '18:00 - 21:00';
      case 4:
        return '21:00 - 23:00';
      default:
        return '';
    }
  }
}
