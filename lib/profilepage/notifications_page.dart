import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text("Notifications"),
        backgroundColor: Colors.white,
        leading: const Padding(padding: EdgeInsets.only(left: 20),
        child: BackButton())

      ),
    );
  }
}