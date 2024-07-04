import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDate = DateTime.now();

  void _onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(Icons.close, color: Color.fromRGBO(188, 188, 191, 1), size: 20,)),
                    
                      GestureDetector(onTap: () => Navigator.of(context).pop(),child: const Text('Сегодня', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color.fromRGBO(188, 188, 191, 1)),))
                    ],
                  ),
                ),
                    

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс']
                        .map((day) => Text(day, style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(188, 188, 191, 1))))
                        .toList(),
                  ),
                ),
                    

                for (int month = 1; month <= 12; month++) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${selectedDate.year}',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color.fromRGBO(188, 188, 191, 1)),
                        ),
                        Text(
                          DateFormat.MMMM('ru').format(DateTime(selectedDate.year, month)),
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color.fromRGBO(76, 76, 105, 1)),
                        ),
                      ],
                    ),
                  ),
                  MonthView(
                    year: selectedDate.year,
                    month: month,
                    selectedDate: selectedDate,
                    onDateSelected: _onDateSelected,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MonthView extends StatelessWidget {
  final int year;
  final int month;
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  MonthView({required this.year, required this.month, required this.selectedDate, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    DateTime firstDayOfMonth = DateTime(year, month, 1);
    DateTime lastDayOfMonth = DateTime(year, month + 1, 0);
    int weekdayOfFirstDay = firstDayOfMonth.weekday;
    int daysInMonth = lastDayOfMonth.day;

    List<Widget> dayWidgets = [];

    for (int i = 1; i < weekdayOfFirstDay; i++) {
      dayWidgets.add(Container(width: 40, height: 40));
    }

    for (int day = 1; day <= daysInMonth; day++) {
      DateTime date = DateTime(year, month, day);
      bool isSelected = date == selectedDate;
      dayWidgets.add(
        GestureDetector(
          onTap: () => onDateSelected(date),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isSelected ? const Color.fromRGBO(255, 135, 2, 0.25) : Colors.transparent,
              shape: BoxShape.circle
            ),
            child: Center(
              child: isSelected ? Column(
                children: [

                  const SizedBox(height: 10,),

                  Text(
                    '$day',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(76, 76, 105, 1),
                    ),
                  ),

                  Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 135, 2, 1),
                      shape: BoxShape.circle
                    ),
                  )
                ],
              ) : Text(
                '$day',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(76, 76, 105, 1),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 7,
        children: dayWidgets,
      ),
    );
  }
}