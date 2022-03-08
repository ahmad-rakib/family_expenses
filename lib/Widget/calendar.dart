// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:scrolling_years_calendar/scrolling_years_calendar.dart';
//
// class Calendar extends StatefulWidget {
//   @override
//   _CalendarState createState() => _CalendarState();
// }
//
// class _CalendarState extends State<Calendar> {
//
//   CalendarController _calendarController;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _calendarController=CalendarController();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return TableCalendar(
//       calendarController: _calendarController,
//       startingDayOfWeek: StartingDayOfWeek.sunday,
//       initialCalendarFormat: CalendarFormat.month,
//
//       calendarStyle: CalendarStyle(
//         outsideDaysVisible: false,
//         weekendStyle: TextStyle(fontSize: 20).copyWith(color: Colors.red[800]),
//         holidayStyle: TextStyle(fontSize: 20).copyWith(color: Colors.red[800]),
//         todayStyle: TextStyle(fontSize: 22, color: Colors.white),
//         weekdayStyle: TextStyle(fontSize: 20),
//         //outsideHolidayStyle: TextStyle(fontSize: 20),
//
//         selectedColor: Colors.blueAccent,
//         selectedStyle: TextStyle(fontSize: 22, color: Colors.white),
//         todayColor: Colors.deepOrange,
//         markersColor: Colors.brown[700],
//       ),
//
//       headerStyle: HeaderStyle(
//         centerHeaderTitle: true,
//         titleTextStyle: TextStyle(fontSize: 24),
//         formatButtonVisible: false,
//         formatButtonTextStyle: TextStyle().copyWith(color: Colors.white, fontSize: 18.0),
//         formatButtonDecoration: BoxDecoration(
//           color: Colors.deepOrange[400],
//           borderRadius: BorderRadius.circular(16.0),
//         ),
//       ),
//     );
//   }
//
//
// }
//
//
// class YearCalendar extends StatefulWidget {
//   @override
//   _YearCalendarState createState() => _YearCalendarState();
// }
//
// class _YearCalendarState extends State<YearCalendar> {
//
//   List<DateTime> getHighlightedDates() {
//     return List<DateTime>.generate(
//       10,
//           (int index) => DateTime.now().add(Duration(days: 10 * (index + 1))),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ScrollingYearsCalendar(
//           // Required properties
//           context: context,
//           initialDate: DateTime.now(),
//           firstDate: DateTime.now().subtract(const Duration(days: 5 * 365)),
//           lastDate: DateTime.now(),
//           currentDateColor: Colors.blue,
//
//           // Optional properties
//           highlightedDates: getHighlightedDates(),
//           highlightedDateColor: Colors.deepOrange,
//           monthNames: const <String>[
//             'Jan',
//             'Feb',
//             'Mar',
//             'Apr',
//             'May',
//             'Jun',
//             'Jul',
//             'Aug',
//             'Sep',
//             'Oct',
//             'Nov',
//             'Dec',
//           ],
//           //onMonthTap: (int year, int month) => print('Tapped $month/$year'),
//         ),
//       ),
//     );
//   }
// }
//
