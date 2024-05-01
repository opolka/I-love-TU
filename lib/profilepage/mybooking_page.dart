import 'package:i_love_tu/bottom_nav_bar.dart';
import 'package:i_love_tu/model/booking.dart';
import 'package:i_love_tu/services/database_service.dart';
import 'package:i_love_tu/model/student_data.dart';
import 'package:i_love_tu/app_colors.dart';
import 'package:flutter/material.dart';


class MyBooking extends StatefulWidget {
  final Students user;
  const MyBooking({super.key, required this.user});

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  late Future<List<Booking>> _bookings;

  @override
  void initState() {
    super.initState();
    _bookings = _fetchBookings();
  }

  Future<List<Booking>> _fetchBookings() async {
    return DatabaseService().booking();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('My Booking'),
          backgroundColor: Colors.white,
          leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: BackButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyButtomNavBar(user: widget.user,index: 2,)),
                );
              }))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  decoration: const BoxDecoration(
                      gradient: AppColors.gradient,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100))),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/myBooking.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: FutureBuilder<List<Booking>>(
                    future: _bookings,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator(); // แสดง Indicator ขณะโหลดข้อมูล
                      } else if (snapshot.hasError) {
                        return Text(
                            'Error: ${snapshot.error}'); // แสดงข้อผิดพลาดหากเกิดข้อผิดพลาดในการโหลดข้อมูล
                      } else if (snapshot.hasData &&
                          snapshot.data!.isNotEmpty) {
                        return Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: MediaQuery.of(context).size.height / 10,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:BorderRadius.all(Radius.circular(30)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(80, 80, 80, 0.5),
                                      blurRadius: 4,
                                      offset: Offset(1, 2),
                                    )
                                  ],),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Stack(
                                      children: [
                                        Center(
                                          child: Icon(
                                            Icons.circle,
                                            color: Color.fromRGBO(
                                                255, 201, 201, 1),
                                            size: 30,
                                          ),
                                        ),
                                        Center(
                                          child: Icon(
                                            Icons.check,
                                            color:Color.fromRGBO(53, 163, 15, 1),
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width / 2,
                                            child: Text(snapshot.data![index].roomBuilding,
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w500
                                              ),
                                              maxLines: 2,
                                            ),
                                          ),
                                          
                                        
                                          Container(
                                            width: MediaQuery.of(context).size.width / 2,
                                            height: 2,
                                            decoration: const BoxDecoration(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text('Type : ${snapshot.data![index].roomType}#${snapshot.data![index].roomNumber}')
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return const Text(
                            'No bookings available'); // ถ้าไม่มีข้อมูลจองให้แสดงข้อความว่าไม่มีข้อมูล
                      }
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
