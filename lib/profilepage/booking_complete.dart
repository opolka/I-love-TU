import 'dart:async';

import 'package:i_love_tu/model/student_data.dart';
import 'package:i_love_tu/profilepage/mybooking_page.dart';
import 'package:flutter/material.dart';

class BookingComplete extends StatefulWidget {
  final Students user;
  const BookingComplete({super.key, required this.user});

  @override
  State<BookingComplete> createState() => _BookingCompleteState();
}

class _BookingCompleteState extends State<BookingComplete> 
  with TickerProviderStateMixin {
    late final AnimationController _controller;

    @override
      void initState() {
      super.initState();
      _controller = AnimationController(vsync: this);
      
      Timer(const Duration(seconds: 3), () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: ((context) => MyBooking(user: widget.user))));
        });
      });
    }

    @override
      void dispose() {
      _controller.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(241, 87, 68, 1),
      body: Center(
        child: Text('Booking Complete',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600),),
      ),
    );
  }
}