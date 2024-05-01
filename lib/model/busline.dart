class BusLines {
  final String busID;
  final String busColor;
  final String busPicture;
  final String busStation;
  final String busTimeStart;
  final String busTimeStop;
  final String busWay;
  final String busStop;

  BusLines({
    required this.busID,
    required this.busColor,
    required this.busPicture,
    required this.busStation,
    required this.busTimeStart,
    required this.busTimeStop,
    required this.busWay,
    required this.busStop
  });

  factory BusLines.fromMap(Map<String, dynamic> map) {
    return BusLines(
      busID: map['busID']?? '',
      busColor: map['busColor']?? '',
      busPicture: map['busPicture']?? '',
      busStation: map['busStation']?? '',
      busTimeStart: map['busTimeStart']?? '',
      busTimeStop: map['busTimeStop']?? '',
      busWay: map['busWay']?? '',
      busStop: map['busStop']?? ''
    );
  }
}


// List<BusLines>buslines = [
//   BusLines(
//     '1A',
//     'สายสีแดง', 
//     'bus-1A.PNG', 
//     'EV Station', 
//     '06:45', 
//     '19:15',
//     'one way',
//     'คณะสถาปัตยกรรมศาสตร์,คณะวิศวกรรมศาสตร์/SIIT,โรงอาหาร SC/JC,หอสมุดป๋วยอึ๊งภากรณ์/อาคารศึกษาศาสตร์,โรงอาหาร Green/โดมบริหาร,หอพักนักศึกษาในมหาวิทยาลัยโซน A,หอพักนักศึกษาในมหาวิทยาลัยโซน B,หอพักนักศึกษาในมหาวิทยาลัยโซน C,อาคารเรียนรวมสังคมศาสตร์(SC)/สนามกีฬาหลักกลางแจ้ง,สถานี EV'
//     ),
//   BusLines(
//     '1B',
//     'สายสีเหลือง', 
//     'bus-1B.PNG', 
//     'EV Station', 
//     '07:00', 
//     '19:30',
//     'one way',
//     'อาคารเรียนรวมสังคมศาสตร์(SC)/สนามกีฬาหลักกลางแจ้ง,หอพักนักศึกษาในมหาวิทยาลัยโซน C,หอพักนักศึกษาในมหาวิทยาลัยโซน B,หอพักนักศึกษาในมหาวิทยาลัยโซน A,โรงอาหาร Green/โดมบริหาร,หอสมุดป๋วยอึ๊งภากรณ์/อาคารศึกษาศาสตร์,โรงอาหาร SCโรงอาหาร SC/JC,คณะสถาปัตยกรรมศาสตร์,คณะวิศวกรรมศาสตร์/SIIT,สถานี EV'
//     ),
//   BusLines(
//     '2',
//     'สายสีเขียว', 
//     'bus-2.PNG', 
//     'EV Station', 
//     '06:40', 
//     '19:30',
//     'same way',
//     'โรงพยาบาลธรรมศาสตร์,อุทยานป๋วย/อาคารสุขศาสตร์,พัชรกิติยาคาร/คณะวิทยาศาสตร์,โรงอาหาร Green/โดมบริหาร,หอพักนักศึกษาในมหาวิทยาลัยโซน A,หอพักนักศึกษาในมหาวิทยาลัยโซน B,สถานี EV'
//     ),
//     BusLines(
//     '3',
//     'สายสีม่วง', 
//     'bus-3.PNG', 
//     'TU DOME Station', 
//     '07:00', 
//     '20:00',
//     'same way',
//     'ประตูเชียงราก 1,อาคารเรียนรวมสังคมศาสตร์(SC)/สนามกีฬาหลักกลางแจ้ง,หอสมุดป๋วยอึ๊งภากรณ์/อาคารศึกษาศาสตร์,โรงอาหาร Green/โดมบริหาร,หอพักนักศึกษาในมหาวิทยาลัยโซน C,หอพักนักศึกษาในมหาวิทยาลัยโซน A,หอพักนักศึกษาในมหาวิทยาลัยโซน B,สถานี TU DOME'
//     ),
//     BusLines(
//     '5',
//     'สายสีฟ้า', 
//     'bus-5.PNG', 
//     'EV Station', 
//     '07:00', 
//     '18:30',
//     'same way',
//     'คณะสถาปัตยกรรมศาสตร์,คณะวิศวกรรมศาสตร์/SIIT,โรงอาหาร SC/JC,หอสมุดป๋วยอึ๊งภากรณ์/อาคารศึกษาศาสตร์,พัชรกิติยาคาร/คณะวิทยาศาสตร์,อุทยานป๋วย/อาคารสุขศาสตร์,โรงพยาบาลธรรมศาสตร์,สถานี EV'
//     ),
// ];

