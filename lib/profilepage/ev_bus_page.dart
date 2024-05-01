import 'dart:async';
import 'package:i_love_tu/bottom_nav_bar.dart';
import 'package:i_love_tu/model/busline.dart';
import 'package:i_love_tu/services/database_service.dart';
import 'package:i_love_tu/model/student_data.dart';
import 'package:i_love_tu/app_colors.dart';
import 'package:flutter/material.dart';



class EvBusPage extends StatefulWidget {
  final Students user;
  const EvBusPage({super.key, required this.user});

  @override
  State<EvBusPage> createState() => _EvBusPageState();
}

class _EvBusPageState extends State<EvBusPage> {
  final DatabaseService _databaseService = DatabaseService();
   int currentWidgetIndex = 1;
   bool showFirstWidget = true;
   String selectedStartPoint = '';
   String selectedEndPoint = '';
   List<BusLines> selectedBuses = [];
   bool indexOfdetail = false;
   String mapImageUrl = 'assets/images/map.png';


    @override
    void initState(){
      super.initState();
  
      Timer(const Duration(seconds: 3), () {
        setState(() {
          currentWidgetIndex = 2;
          showFirstWidget = false;
        });
      });
      _loadSelectedBuses();
    }

    void changeToBusWidget() {
      setState(() {
        currentWidgetIndex = 3;
        _loadSelectedBuses();
      });
    }
    void changeMapBackground(String url) {
      setState(() {
        mapImageUrl = 'assets/images/$url';
      });
    }

    Future<List<BusLines>> findBusByStops(String startPoint,String endPoint) async{
        final buslines =  await _databaseService.bus();
        List<BusLines> buses = [];
          for (var bus in buslines) {
            if (bus.busStop.split(',').contains(startPoint) && bus.busStop.split(',').contains(endPoint)) {
              buses.add(bus);
            }
              
          }
          return buses;
      
    }
    Future<void> _loadSelectedBuses() async {
      List<BusLines> buses = await findBusByStops(selectedStartPoint, selectedEndPoint);
      setState(() {
        selectedBuses = buses;
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("EV Bus"),
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: BackButton(
              onPressed: () {
                if (currentWidgetIndex == 3) {
                  setState(() {
                    currentWidgetIndex = 2;
                  });
                } else {

                  setState(() {
                    selectedStartPoint = '';
                    selectedEndPoint = '';
                  });
                  

                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyButtomNavBar(user: widget.user,index: 0,)),
                  );
                }
              }
              
            ),
          ),
        ),
        body: Stack(
          children: [
            buildMap(mapImageUrl),
            buildmapPopupfirst()

        ]),
        
       
        
      );
  }
 


  Widget buildMap(String url) {
    return Container(
      height: MediaQuery.of(context).size.height/1.7,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(url),
            fit: BoxFit.cover)
       ),
     );
  }

  Widget buildPopup() {
    return Container(
      child: showFirstWidget
          ? buildWelcomeText()
          : buildFillDestination(),
    );
  }

  Widget buildmapPopupfirst() {
    Widget currentWidget;
    switch (currentWidgetIndex) {
      case 1:
        currentWidget = buildWelcomeText();
      break;
      case 2:
        currentWidget = buildFillDestination();
      break;
      case 3:
        currentWidget = buildBusdetail();
        indexOfdetail = true;
      break;
      default:
        currentWidget = Container();
    }
    return SingleChildScrollView(
      child: Padding(
        padding: showFirstWidget
        ? EdgeInsets.only(top:MediaQuery.of(context).size.height/1.8)
        : EdgeInsets.only(top:MediaQuery.of(context).size.height/2.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 
              showFirstWidget
                  ? MediaQuery.of(context).size.height/3
                  : currentWidgetIndex == 2
                    ? MediaQuery.of(context).size.height/2
                    : selectedBuses.isNotEmpty
                    ? MediaQuery.of(context).size.height/2*selectedBuses.length
                    : MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                  gradient: AppColors.gradient
              ),
              
              child: Center(
                child: currentWidget,
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  Widget buildWelcomeText() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width/13,
          color: Colors.white),
        children:[
          const TextSpan(
            text: 'Where would you like\nto go '),
          TextSpan(
            text: 'today?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width/10
              ) )
        ]
      )
      );
  }

  Widget buildFillDestination() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: DropdownButton<String>(
                onChanged: (newValue) {
                  setState(() {
                    selectedStartPoint = newValue!;
                  });
                },
                items: destinations.toSet().map((destination) {
                  return DropdownMenuItem<String>(
                    value: destination,
                    child: Text(destination,style: const TextStyle(fontFamily: 'IBM Plex Sans'),));
                }).toList(),
                hint: selectedStartPoint.isNotEmpty
                ? Text(selectedStartPoint,style: const TextStyle(color: Colors.black,fontFamily: 'IBM Plex Sans'),)
                : const Text('เลือกจุดเริ่มต้น',style: TextStyle(fontFamily: 'IBM Plex Sans'),),
                underline: Container(),
                menuMaxHeight: MediaQuery.of(context).size.height/5,
                borderRadius: BorderRadius.circular(10),
              
                        ),
            ),
          ),


          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: DropdownButton<String>(
                onChanged: (newValue) {
                  setState(() {
                    selectedEndPoint = newValue!;
                  });
                },
                items: destinations.toSet().map((destination) {
                  return DropdownMenuItem<String>(
                    value: destination,
                    child: Text(destination,style: const TextStyle(fontFamily: 'IBM Plex Sans'),));
                }).toList(),
                hint: selectedEndPoint.isNotEmpty
                    ? Text(selectedEndPoint,style: const TextStyle(color: Colors.black,fontFamily: 'IBM Plex Sans'))
                    : const Text('เลือกจุดหมายปลายทาง',style: TextStyle(fontFamily: 'IBM Plex Sans'),),
                underline: Container(),
                menuMaxHeight: MediaQuery.of(context).size.height/5,
                borderRadius: BorderRadius.circular(10)
              
                        ),
            ),
          ),
          
          
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: MaterialButton(
                onPressed: () => {
                  changeToBusWidget()
                },
                padding: const EdgeInsets.symmetric(vertical: 10),
                minWidth: MediaQuery.of(context).size.width,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)
                ),
                child: const Text("continue",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25),),
              
              ),
              
            ),
          )
        ],
      
      ),
    );
  }


  Widget buildBusdetail() {
    return selectedBuses.isEmpty
        ? Center(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/nobus.png'))
                ),
              ),
              Text("Sorry , we don't have\nany buses for this route.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height/40,
                fontWeight: FontWeight.bold),)

            ],
          ))
        : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  for (var bus in selectedBuses)
                    Column(
                      children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50,right: 50,top: 50),
                        child: MaterialButton(
                          onPressed: () => {
                            changeMapBackground('${bus.busID}.PNG')
                          },
                          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/48),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/${bus.busPicture}'),
                                        fit: BoxFit.fitHeight
                                        ),
                                    ),
                                  height: MediaQuery.of(context).size.width/8 ,
                                  width: MediaQuery.of(context).size.width/4,
                                  ),
                                  Text('Bus ${bus.busID}' ,style: const TextStyle(fontSize: 30,fontFamily: 'IBM Plex Sans',fontWeight: FontWeight.bold,color: Color.fromRGBO(241, 87, 68, 1))),
                                  Text(bus.busColor,style: const TextStyle(fontSize: 20,fontFamily: 'IBM Plex Sans',fontWeight: FontWeight.w600,color: Color.fromRGBO(241, 87, 68, 1)))
                                ],
                            ),
                          
                                        
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text('เวลาทำการตั้งแต่ ${bus.busTimeStart} - ${bus.busTimeStop} น.',
                        style: const TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Stack(
                          children: [
                            Icon(Icons.fmd_good,size: 40,color: Color.fromRGBO(241, 87, 68, 1)),
                            Icon(Icons.fmd_good_outlined,size: 40,color: Colors.black),
                          ],),
                        Text(selectedEndPoint,style: const TextStyle(fontSize: 22,color: Colors.white,fontFamily: 'IBM Plex Sans',fontWeight: FontWeight.bold))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: buildIconDestinations()),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/6.3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(selectedStartPoint,style: const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: 'IBM Plex Sans')),
                              Text(selectedEndPoint,style: const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: 'IBM Plex Sans'))
                            ],
                          ),
                        )
                      ],
                    )
                    ],
                    )
                      
                    
              ],
              
            
          );
  }

  Widget buildIconDestinations() {
    return Column(
            children: [
              const Stack(
                alignment: Alignment.center,
                children: [
                  Icon(Icons.circle_rounded,size: 30,color: Color.fromRGBO(255, 148, 134, 1)),
                  Icon(Icons.circle_rounded,size: 20,color: Colors.white)
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height/10,
                width: 4,
                decoration: const BoxDecoration(
                  gradient: AppColors.gradient2
                ),
              ),

              const Stack(
                alignment: Alignment.center,
                children: [
                  Icon(Icons.circle_rounded,size: 30,color: Color.fromRGBO(239, 85, 65, 1)),
                  Icon(Icons.circle_rounded,size: 20,color: Colors.white)
                ],
              )
            ],
          );
  }
 
}


  
  final List <String> destinations =  [
  'โรงพยาบาลธรรมศาสตร์',
  'อุทยานป๋วย/อาคารสุขศาสตร์',
  'พัชรกิติยาคาร/คณะวิทยาศาสตร์',
  'โรงอาหาร Green/โดมบริหาร',
  'โรงอาหาร SC/JC',
  'หอพักนักศึกษาในมหาวิทยาลัยโซน A',
  'หอพักนักศึกษาในมหาวิทยาลัยโซน B',
  'หอพักนักศึกษาในมหาวิทยาลัยโซน C',
  'อาคารเรียนรวมสังคมศาสตร์(SC)\n/สนามกีฬาหลักกลางแจ้ง',
  'หอสมุดป๋วยอึ๊งภากรณ์\n/อาคารศึกษาศาสตร์',
  'คณะวิศวกรรมศาสตร์/SIIT',
  'คณะสถาปัตยกรรมศาสตร์',
  'ประตูเชียงราก 1',
  'สถานี EV',
  'สถานี TU Dome'
];

