import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  // Set<DateTime?_>selectedDay;
   Set<DateTime> _selectedDays = {DateTime.utc(2024,3,29),DateTime.utc(2024,3,24)};
  bool _isSelected(DateTime day) {
    // Implement your logic to determine if a day should be selected
    // For example, you can check if the day falls within a certain range
    return _selectedDays.contains(day);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Example'),
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2024, 1, 1),
        lastDay: DateTime.utc(2024, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            //_selectedDay = selectedDay;
            //_focusedDay = focusedDay;
               _focusedDay = focusedDay;
                _selectedDays.add(selectedDay);
      // Update values in a Set
      if (_selectedDays.contains(selectedDay)) {
       // _selectedDays.remove(selectedDay);

      } else {
        _selectedDays.add(selectedDay);
      }
          });
        },
        // selectedDayPredicate: (day) {
        //   return isSameDay(_selectedDays.contains(day), day);
        // },
        selectedDayPredicate: _isSelected,
        // Optional: Define custom styles
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          selectedTextStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
