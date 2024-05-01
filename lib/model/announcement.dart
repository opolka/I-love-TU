class Announcement {
  final String imageOfAnnounce;


  Announcement({
    required this.imageOfAnnounce,
  });

    Map<String, dynamic> toMap() {
    return {
      'imageOfAnnounce': imageOfAnnounce,
    };
  }

  factory Announcement.fromMap(Map<String, dynamic> map) {
    return Announcement(
      imageOfAnnounce: map['imageOfAnnounce'] ?? '',
    );
  }
}

// List<Announcement> announcements = [
//   Announcement(
//     'assets/images/satid.JPG',
//     "แนวคิดเบื้องหลัง 'สาธิต มธ.' กับการสร้างระบบนิเวศ\nการเรียนรู้-พื้นที่ความสุขและมีความหมายสำหรับทุกคน",
//     '14',
//     'MARCH',
//     '2024',
//     ''
//   ),
//     Announcement(
//     'assets/images/sunflower.JPG',
//     "'เอเนอร์จี้ ๆ' ไม่มีทางอ่อมแน่นอนกับงาน Sunflower Fest",
//     '14',
//     'MARCH',
//     '2024',
//     'หมดเวลานักรบมิดเทอม ถึงเวลาเฉิดฉายหน้าที่ไปกับงาน Sunflower Fest 19 มีนาคม นี้ เจอกันที่ลานพญานาค งานนี้บอกได้มีแต่คำว่า “เอเนอร์จี้ ๆ” ไม่มีทางอ่อมแน่นอน เพราะงานนี้กองสันฯ การันตีได้เลยว่า“สนุกจนลืมเหนื่อย”'
//   ),
//   Announcement(
//     'assets/images/tuCheerShrit.JPG',
//     "Size Chart มาแล้ววว เตรียมตัวให้พร้อมก่อนเป็นเจ้าของเสื้อเชียร์ฯ",
//     '11',
//     'MARCH',
//     '2024',
//     'อย่าลืมวัดก่อนมาซื้อที่ "งานเปิดตัวเสื้อเชียร์ (ครบรอบ 90 ปี ธรรมศาสตร์)" \nเสื้อเชียร์รุ่นพิเศษ เริ่มต้นราคาเดิม 295 บาทเท่านั้น\nวันพฤหัสบดี 21 มีนาคมนี้'
//   ),
//   Announcement(
//     'assets/images/ChangeCamp.JPG',
//     "นี่ไม่ใช่ค่าย แต่นี่คือการเดินทางแห่งการเติบโต",
//     '27',
//     'FEBRUARY',
//     '2024',
//     ''
//   ),
// ];