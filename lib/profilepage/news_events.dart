import 'package:i_love_tu/model/news.dart';
import 'package:flutter/material.dart';

class NewsEventPage extends StatelessWidget  {
  final String imageNew;
  final List<NewEvent> newevents;
  final int index;
  const NewsEventPage({super.key, required this.imageNew, required this.newevents,required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text("News & Event"),
        backgroundColor: Colors.white,
        leading: const Padding(padding: EdgeInsets.only(left: 20),
        child: BackButton())
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('/Users/pornlavin/Desktop/opol_tuapp/$imageNew'))
              ),
            ),
            Text(newevents[index].announceNew,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width/20,
              fontFamily: 'IBM Plex Sans',
              fontWeight: FontWeight.w600,
              ),
            //textAlign: TextAlign.center
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(newevents[index].dataInsideNew,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width/25,
                fontFamily: 'IBM Plex Sans',
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
                ),
              maxLines: 10,
              //textAlign: TextAlign.center
              ),
            ),

          ],
        ),
      )
    );
  }
}
