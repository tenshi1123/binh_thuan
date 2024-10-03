import 'package:binh_thuan/constants/colors.dart';
import 'package:binh_thuan/constants/styles.dart';
import 'package:binh_thuan/models/calender_model.dart';
import 'package:binh_thuan/modules/bottom_navigation_bar/home/custom_widget_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'utils.dart';

class TableEventsExample extends StatefulWidget {
  const TableEventsExample({super.key, required this.listCalender});
  final List<CalenderEventModel> listCalender;
  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  late final ValueNotifier<List<CalenderEventModel>> _selectedEvents;
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  late List<CalenderEventModel> listCalender;
  @override
  void initState() {
    super.initState();
    listCalender = widget.listCalender;
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventModels(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  // List<Event> _getEventsForDay(DateTime day) {
  //   // Implementation example
  //   return kEvents[day] ?? [];
  // }

  List<CalenderEventModel> _getEventModels(DateTime day) {
    List<CalenderEventModel> test = [
      ...listCalender.where((e) => e.day.day == day.day)
    ];
    return test;
  }

  List<CalenderEventModel> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventModels(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventModels(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventModels(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventModels(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 120.h,
        flexibleSpace: FlexibleSpaceBar(
          background: Stack(
            children: [
              Positioned(
                top: 0,
                child: Image(
                  height: 140.h,
                  width: MediaQuery.of(context).size.width,
                  image:
                      const AssetImage('assets/images/appbar_background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 140.w,
                top: 80.h,
                child: Text(
                  'Lịch học',
                  style: defaultText20.copyWith(
                      color: keyWhite,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Nunito-Bold'),
                ),
              ),
              Positioned(
                  left: 10.w,
                  bottom: 20.h,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ))
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          TableCalendar<CalenderEventModel>(
            locale: 'vi_VI',
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
            },
            headerStyle: HeaderStyle(titleTextStyle: defaultText16),
            daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: defaultText14,
                weekendStyle: defaultText14.copyWith(
                  color: Colors.red,
                )),
            daysOfWeekHeight: 30.h,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventModels,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                return events.isNotEmpty
                    ? _buildEventsMarkerNum(events)
                    : Container();
              },
            ),
            calendarStyle: CalendarStyle(
                // Use `CalendarStyle` to customize the UI
                outsideDaysVisible: true,
                defaultTextStyle: defaultText14,
                weekendTextStyle: defaultText14.copyWith(color: Colors.red),
                todayTextStyle: defaultText14.copyWith(color: Colors.white)),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<CalenderEventModel>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return value.isEmpty
                    ? Center(
                        child: Text(
                          'Không có lịch học',
                          style: defaultBoldText,
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        padding: const EdgeInsets.all(8),
                        itemCount: value.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemTableCalender(
                            model: value[index],
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildEventsMarkerNum(List events) {
  return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
    buildCalendarDayMarker(text: '${events.length}', backColor: rec19Blue)
  ]);
}

AnimatedContainer buildCalendarDayMarker({
  required String text,
  required Color backColor,
}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      color: backColor,
    ),
    width: 18.w,
    height: 13.h,
    child: Center(
      child: Text(
        text,
        style: const TextStyle().copyWith(
          color: Colors.white,
          fontSize: 12.sp,
        ),
      ),
    ),
  );
}
