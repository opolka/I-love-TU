import 'package:i_love_tu/model/student_data.dart';
import 'package:i_love_tu/profilepage/booking_page.dart';
import 'package:i_love_tu/profilepage/ev_bus_page.dart';
import 'package:i_love_tu/home_page.dart';
import 'package:i_love_tu/profile_page.dart';
import 'package:flutter/material.dart';

class MyButtomNavBar extends StatefulWidget {
  final Students user;
  final int index;

  const MyButtomNavBar({Key? key, required this.user, required this.index})
      : super(key: key);

  @override
  State<MyButtomNavBar> createState() => _MyButtomNavBarState();
}

class _MyButtomNavBarState extends State<MyButtomNavBar> {
  late int myCurrentIndex;
  late List<Widget> pages;
  @override
  void initState() {
    super.initState();
    myCurrentIndex = widget.index;
    pages = [
      HomePage(user: widget.user),
      EvBusPage(user: widget.user),
      BookingPage(user: widget.user),
      ProfilePage(user: widget.user)
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isEvBusPage = myCurrentIndex == 1;

    return Scaffold(
      bottomNavigationBar: isEvBusPage
          ? null
          : Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 80,
                      offset: Offset(0, 50))
                ],
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: BottomNavigationBar(
                  selectedItemColor: const Color.fromRGBO(241, 87, 68, 1),
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  unselectedItemColor: Colors.black,
                  currentIndex: myCurrentIndex,
                  onTap: (index) {
                    setState(() {
                      myCurrentIndex = index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home_rounded,
                          size: 40,
                        ),
                        label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.directions_bus_rounded, size: 40),
                        label: "EV Bus"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.book_outlined,
                          size: 40,
                        ),
                        label: "Booking"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.person,
                          size: 40,
                        ),
                        label: "proflie")
                  ],
                  type: BottomNavigationBarType.fixed,
                ),
              )),
      body: pages[myCurrentIndex],
    );
  }
}

  // Widget _getPageByIndex(int index) {
  //   switch (index) {
  //     case 0:
  //       return HomePage(user: widget.user);
  //     case 1:
  //       return const EvBusPage();
  //     case 2:
  //       return BookingPage(user: widget.user);
  //     case 3:
  //       return ProfilePage(user: widget.user);
  //     // หน้าอื่น ๆ
  //   }
  // }