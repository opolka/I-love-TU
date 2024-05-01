import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDate extends StatefulWidget {
  final String title;
  final TextEditingController ctllerText;

  const SelectDate({
    Key? key,
    required this.title,
    required this.ctllerText,
  }) : super(key: key);

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  @override
  Widget build(BuildContext context) {
  DateTime? selectedDate;

  return ListTile(
    leading: Text(widget.title, style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02, color: Colors.black)),
    title: TextField(
      controller: widget.ctllerText,
      decoration: const InputDecoration(
        hintText: 'Select Date',
        suffixIcon: Icon(Icons.date_range_rounded),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.63)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.63))),
        filled: true,
        fillColor: Color.fromRGBO(255, 255, 255, 0.63),
      ),
      readOnly: true,
      onTap: () {
        datePick(context, widget.ctllerText, (DateTime? date) {
          if (date != null) {
            selectedDate = date;
            String formattedDate = DateFormat('dd/MM/yyyy').format(date);
            widget.ctllerText.text = formattedDate;
          }
        });
      },
    ),
  );
}

Future<void> datePick(BuildContext context, TextEditingController dateController, Function(DateTime?) onDateSelected) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1800),
    lastDate: DateTime(2101),
  );

  onDateSelected(pickedDate);
}
}