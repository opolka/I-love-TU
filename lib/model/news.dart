class NewEvent {
  final String imageNew;
  final String announceNew;
  final String dateNew;
  final String monthNew;
  final String yearNew;
  final String dataInsideNew;

  NewEvent ({
  required this.imageNew,
  required this.announceNew,
  required this.dateNew,
  required this.monthNew,
  required this.yearNew,
  required this.dataInsideNew,
});
  factory NewEvent.fromMap(Map<String, dynamic> map) {
      return NewEvent(
        imageNew: map['imageNew'] ?? '',
        announceNew: map['announceNew'] ?? '',
        dateNew: map['dateNew'] ?? '',
        monthNew: map['monthNew'] ?? '',
        yearNew: map['yearNew'] ?? '',
        dataInsideNew: map['dataInsideNew'] ?? '',
      );
    }
}


// List<NewEvent> newevents = [
//   NewEvent(
//     'assets/images/new1.JPG',
//     "คณะวิทย์ฯ ธรรมศาสตร์ ร่วมมือ 'ไทยรับประกันภัยต่อ' ผลิตบัณฑิตวิทยาการประกันภัย ตอบโจทย์ภาคเอกชน",
//     '15',
//     'MARCH',
//     '2024',
//     'คณะวิทยาศาสตร์และเทคโนโลยี มหาวิทยาลัยธรรมศาสตร์ ลงนามความร่วมมือ บริษัท ไทยรับประกันภัยต่อ จำกัด (มหาชน) ส่งเสริมและสนับสนุนการผลิตบัณฑิตวิทยาการประกันภัย'
//   ),
//     NewEvent(
//     'assets/images/new2.JPG',
//     "'ธรรมศาสตร์' รำลึก 108 ปีชาตกาล 'ศ.ดร.ป๋วย อึ๊งภากรณ์'",
//     '14',
//     'MARCH',
//     '2024',
//     'มหาวิทยาลัยธรรมศาสตร์ จัดงาน “วันอาจารย์ป๋วย อึ๊งภากรณ์” ประจำปี 2567 เมื่อวันที่ 9 มีนาคม 2567 เพื่อแสดงมุทิตาจิตและรำลึกถึงคุณงามความดีของศาสตราจารย์ ดร.ป๋วย อึ๊งภากรณ์ โดยจัดพิธีสงฆ์ ณ หอประชุมใหญ่ มหาวิทยาลัยธรรมศาสตร์ ท่าพระจันทร์ และจัดปาฐกถาพิเศษ ป๋วย อึ๊งภากรณ์ ครั้งที่ 19 ในวาระครบรอบ 75 ปี คณะเศรษฐศาสตร์ มหาวิทยาลัยธรรมศาสตร์ โดยสองนักเศรษฐศาสตร์การเมืองแห่งยุคสมัย'
//   ),
//   NewEvent(
//     'assets/images/new3.JPG',
//     "โครงการแลกเปลี่ยน ณ Pukyong National University สาธารณรัฐเกาหลี",
//     '13',
//     'MARCH',
//     '2024',
//     'โครงการแลกเปลี่ยน ณ Pukyong National University สาธารณรัฐเกาหลี พร้อมโอกาสรับทุนภายใต้โครงการ CAMPUS Asia-AIMS Project ประจำภาคการศึกษา Fall 2024 (สิงหาคม - ธันวาคม 2567)'
//   ),
//   NewEvent(
//     'assets/images/new4.JPG',
//     "Japanese Language program with JASSO scholarship",
//     '13',
//     'MARCH',
//     '2024',
//     'Meiji University Short-term Japanese Language Program (Summer 2024) \nIt will cover not only Japanese language study, but also project work and exchange activities with Japanese cultural experiences\nThe application period is Mar 4th, 2024 April 7th, 2024 (Japan Time).  '
//   ),
// ];