import 'package:i_love_tu/model/student_data.dart';
import 'package:i_love_tu/profilepage/booking_1.dart';
import 'package:i_love_tu/profilepage/booking_2.dart';
import 'package:i_love_tu/profilepage/mybooking_page.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  final Students user;

  const BookingPage({Key? key, required this.user}) : super(key: key);


  @override
  State<BookingPage> createState() => _MyWidgetState();
}


class _MyWidgetState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: screenWidth/1.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/Booking1.PNG'))
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 40),
                  child: Column(
                      children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                                  "Booking your\nreading room today!",
                                    style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width/14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Kulim',
                                    color: Colors.orange),
                                ),
                      ),
              
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => MyBooking(user: widget.user))));
                        },
                        color: const Color.fromRGBO(241, 87, 68, 1),
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                        child: Text("My Booking",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width/25,
                            fontFamily: 'Kulim',
                            fontWeight: FontWeight.bold)), 
                      ),
                          
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: screenWidth,
                        height: screenHeight/5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                           image: AssetImage("assets/images/book1.jpg"),
                              
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),BlendMode.darken)
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                              Row(
                                children: [
                                Icon(Icons.fmd_good,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.width/13,
                                ),   
                                Text(
                                  "Krom Luang Naradhiwas\nRajanagarinda Leraning Centre ",
                                  style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width/25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kulim',
                                  color: Colors.white),
                                      )    
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                  MaterialButton(
                                    minWidth: screenWidth/4.5,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: ((context) => Booking1(user: widget.user))));
                                    },
                                    color:  const Color.fromRGBO(241, 87, 68, 1),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                      child: Text("Book",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context).size.width/25 ,
                                          fontFamily: 'Kulim',
                                          fontWeight: FontWeight.bold)),
                                    ) 
                                  ],
                                ),
                              )
                              ]
                            ),
                          )
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: screenWidth,
                        height: screenHeight/5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                           image: AssetImage("assets/images/book2.jpg"),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),BlendMode.darken)
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                              Row(
                                children: [
                                Icon(Icons.fmd_good,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.width/13,
                                ),   
                                Text(
                                  "Pueys Ungphakorn Libary",
                                  style: TextStyle(
                                  fontSize:MediaQuery.of(context).size.width/25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kulim',
                                  color: Colors.white),
                                      )    
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                  MaterialButton(
                                    minWidth: screenWidth/4.5,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: ((context) => Booking2(user: widget.user))));
                                    },
                                    color:  const Color.fromRGBO(241, 87, 68, 1),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                      child: Text("Book",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context).size.width/25,
                                          fontFamily: 'Kulim',
                                          fontWeight: FontWeight.bold)),
                                    ) 
                                  ],
                                ),
                              )
                              ]
                            ),
                          )            
                    
                  
                      )
              
                          ],
                        ),
              )),
            ],
          ),
        ],
      ),
    ); 
  } //widget
}//class
