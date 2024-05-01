class KromLuangRoom {
  final String typeRoom;
  final String numPeople;
  final int numCheck;
  final String building;
  final String floorNo;
  final String support;
  final String imageURL;

  KromLuangRoom(
      {required this.typeRoom,
      required this.numPeople,
      required this.numCheck,
      required this.building,
      required this.floorNo,
      required this.support,
       required this.imageURL});
  factory KromLuangRoom.fromMap(Map<String, dynamic> map) {
    return KromLuangRoom(
        typeRoom: map['typeRoom'] ?? '',
        numPeople: map['numPeople'] ?? '',
        numCheck: map['numCheck'] ?? '',
        building: map['building'] ?? '',
        floorNo: map['floorNo'] ?? '',
        imageURL: map['image_url'] ?? '',
        support: map['support'] ?? '');
  }
}

// class KromLuangRoom {
//   final String typeRoom;
//   final String numPeople;
//   final int numCheck;
//   final String building;
//   final String floorNo;
//   final List<String> support;

//   KromLuangRoom({
//     required this.typeRoom,
//     required this.numPeople,
//     required this.numCheck,
//     required this.building,
//     required this.floorNo,
//     required this.support
// });
//   Map<String, dynamic> toMap() {
//     return {
//       'typeRoom': typeRoom,
//       'numPeople': numPeople,
//       'numCheck': numCheck,
//       'building': building,
//       'floorNo': floorNo,
//       'support': support.join(', '), // รวมข้อมูลใน List ให้เป็น String โดยใช้คั่นด้วยเครื่องหมาย ', '
//     };
//   }
// }

// List<KromLuangRoom> kromLuangRooms = [
//   KromLuangRoom(
//     typeRoom: 'Advisor Room',
//     numPeople: '2-4',
//     numCheck: 2,
//     building: 'Krom Luang Naradhiwas Rajanagarinda Learning centre',
//     floorNo: '2',
//     support: ['TV', 'Board', 'HDMI Port'],
//   ),
//     KromLuangRoom(
//     typeRoom: 'Tutoring Room',
//     numPeople:'4-8',
//     numCheck: 4,
//     building: 'Krom Luang Naradhiwas Rajanagarinda Learning centre',
//     floorNo: '2',
//     support: ['TV','Board','HDMI Port'], 
//   ),
//     KromLuangRoom(
//     typeRoom:'Study Pod',
//     numPeople: '1',
//     numCheck: 1,
//     building: 'Krom Luang Naradhiwas Rajanagarinda Learning centre',
//     floorNo: '4',
//     support: ['Computer'],
//   )
// ];


