class PueyUngphakorn {
  final String typeRoom;
  final String numPeople;
  final int numCheck;
  final String building;
  final String floorNo;
  final String support;
  final String imageURL;

  PueyUngphakorn({
    required this.typeRoom,
    required this.numPeople,
    required this.numCheck,
    required this.building,
    required this.floorNo,
    required this.support,
    required this.imageURL
  });

  factory PueyUngphakorn.fromMap(Map<String, dynamic> map) {
    return PueyUngphakorn(
      typeRoom: map['typeRoom']?? '',
      numPeople: map['numPeople']?? '',
      numCheck: map['numCheck']?? '',
      building: map['building']?? '',
      floorNo: map['floorNo']?? '',
      support: map['support']?? '',
      imageURL: map['image_url']?? ''
    );
  }
}

// List<PueyUngphakorn> puey = [
//   PueyUngphakorn(
//     'Study Room',
//     '6-16',
//     4,
//     'Puey Ungphakorn Libary',
//     '1',
//     ['TV','Board','HDMI Port'],
//   )
// ];
