
import 'package:carousel_slider/carousel_slider.dart';
import 'package:i_love_tu/model/announcement.dart';
import 'package:i_love_tu/services/database_service.dart';
import 'package:i_love_tu/model/student_data.dart';
import 'package:i_love_tu/profilepage/anouncement_page.dart';
import 'package:i_love_tu/profilepage/news_events.dart';
import 'package:i_love_tu/profilepage/notifications_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  final Students user;

  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final DatabaseService _databaseService = DatabaseService();

  //bool _showNavBar = false;
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    //_showNavBar = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: buildProfile(widget.user),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.notifications_outlined,
                        size: MediaQuery.of(context).size.width/15),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: ((context) => const NotificationsPage()))
                            );
                        }
                      )
                        
                        
                    ]
                  )
                ],
                          
              ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  margin: const EdgeInsets.only(top: 40,bottom: 10),
                  child: Text("ANNOUNCEMENT",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width/25),)
                ),
              ),
            
              Center(
                child: FutureBuilder<List<Announcement>>(
                  future: _databaseService.announce(),
                  builder:(context, snapshot) {
                    if (snapshot.hasData) {
                      final announcements = snapshot.data!;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height/4,
                            initialPage: 0,
                            viewportFraction: 1,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            onPageChanged: (index, reason) =>
                              setState(() => _activeIndex = index),
                            ),
                          itemCount: announcements.length,
                          itemBuilder: (context,index,realIndex){
                            final imageUrl = announcements[index].imageOfAnnounce;
                            return buildImage1(imageUrl);
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child:  buildIndicator(announcements),
                        )
                      
                      ],
                        );
                        } else {
                            return Center(child: Text('Error: ${snapshot.error.toString()}'));
                        }
                  }
                )
            ),
            

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  margin: const EdgeInsets.only(top: 40,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("NEWS & EVENT",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width/25),
                      ),
                      
                
                    ],)
                    
                ),
              ),
              Center(
                child: FutureBuilder(
                  future: _databaseService.news(),
                  builder:(context, snapshot) {
                    if (snapshot.hasData) {
                      final newevents = snapshot.data!;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height/1.7,
                            initialPage: 1,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) =>
                              setState(() => _activeIndex = index),
                            ),
                          itemCount: newevents.length,
                          itemBuilder: (context,index,realIndex){
                            final imageNew = newevents[index].imageNew;
                            return Container(child: buildImage2(imageNew, index, newevents));
                          },
                        ),
                      ],
                      );
                  } else {
                            return Center(child: Text('Error: ${snapshot.error.toString()}'));
                        }
                  }
                )
  
  
            ),
            ],
          ),
        )
      ),
       
      //bottomNavigationBar: _showNavBar ? MyButtomNavBar() : null, 
    );
  }
  Widget buildImage1(String image) => MaterialButton(
    onPressed:() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: ((context) => AnnouncePage(imageAnnounce: image)))
      );
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover
      )
      )
    ),
  );


  Widget buildImage2(String image, int index,var newevents) => MaterialButton(
    onPressed:() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: ((context) =>  NewsEventPage(imageNew: image, newevents: newevents, index: index)))
      );
    },
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height/5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
          )
          ),
          
        ),
        Container(
          child: buildNews(index,newevents),
        )
      ],
    ),
  );

  Widget buildNews(int index, var newevents) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    height: MediaQuery.of(context).size.height*3/10,
    width: MediaQuery.of(context).size.width,

    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
      color:  Color.fromRGBO(230, 230, 230, 0.7)
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(newevents[index].announceNew,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width/20,
            fontWeight: FontWeight.w600,
            fontFamily: 'IBM Plex Sans'),
          ),
          Text(newevents[index].dataInsideNew,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width/30,
                fontFamily: 'IBM Plex Sans',
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 5,
            
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('${newevents[index].dateNew} ${newevents[index].monthNew} ${newevents[index].yearNew}',
              style: TextStyle(fontSize: MediaQuery.of(context).size.width/36),
              
              ),
            
          ),
        ],
      )
    )

  );



  Widget buildIndicator(var announcements) => AnimatedSmoothIndicator(
    activeIndex: _activeIndex,
    count: announcements.length,
    effect: const ExpandingDotsEffect(
      dotWidth: 8,
      dotHeight: 8,
      activeDotColor: Colors.orange,
      dotColor:  Color(0xC3C3C3C3)
    )
  );


  Widget buildProfile(Students user) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/30),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor:const Color.fromRGBO(255, 130, 91, 1),
            radius: MediaQuery.of(context).size.width/20,
            child: user.imageURL.isEmpty
            ? Icon(Icons.account_circle_rounded,
              size: MediaQuery.of(context).size.width/10,
              color: Colors.white
              )
            : CircleAvatar(
              backgroundImage: AssetImage('assets/userImage/${user.imageURL}.JPG'),
              radius: MediaQuery.of(context).size.width/20)
              
            
            
          ),
          
          // Icon(Icons.account_circle_rounded,
          //   size: MediaQuery.of(context).size.width/7,
          //   color: const Color.fromRGBO(255, 130, 91, 1)),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(user.firstName,
              style: TextStyle(
              fontSize: MediaQuery.of(context).size.width/22,
              fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ]
      ),
    );
  }
  
}



