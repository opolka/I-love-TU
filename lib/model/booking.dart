class Booking {
  final String userID;
  final String roomBuilding;
  final String roomType;
  final String roomNumber;
  final String time;

  Booking({
    required this.userID,
    required this.roomBuilding,
    required this.roomType,
    required this.roomNumber,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'student_id': userID,
      'room_building': roomBuilding,
      'room_type': roomType,
      'room_number': roomNumber,
      'time': time,
    };
  }
}
