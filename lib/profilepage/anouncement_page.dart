import 'package:flutter/material.dart';

class AnnouncePage extends StatelessWidget {
  final String imageAnnounce;
  const AnnouncePage({super.key, required this.imageAnnounce});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Announcement"),
          backgroundColor: Colors.white,
          leading: const Padding(
              padding: EdgeInsets.only(left: 20), child: BackButton())),
      body: Container(
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 4),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    '/Users/pornlavin/Desktop/opol_tuapp/$imageAnnounce'),
                fit: BoxFit.fitWidth)),
      ),
    );
  }
}
