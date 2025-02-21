import 'package:eliachar_feig/models/activity_model.dart';
import 'package:eliachar_feig/models/filters.dart';
import 'package:eliachar_feig/packages/ui_components_packages.dart';
import 'package:eliachar_feig/screens/activities/widgets/activity_card.dart';
import 'package:eliachar_feig/ui_components/horizontal_filter_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../packages/utlis_packages.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  ActivitiesState createState() => ActivitiesState();
}

class ActivitiesState extends State<Activities> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  Filters selectedFilter = Filters(value: "all", label: "All", isSelected: true);
  final List<Filters> filters = [
    Filters(value: "all", label: "All", isSelected: false),
    Filters(value: "transaction", label: "Transactions", isSelected: false),
    Filters(value: "events", label: "Events", isSelected: false),
    Filters(value: "outreaches", label: "Outreaches", isSelected: false),
  ];
  // Mock Data
  final List<ActivityModel> activities = [
    ActivityModel.getMockDataTransaction(date: getTodayDate()),
    ActivityModel.getMockDataOutreaches(date: getTodayDate()),
    ActivityModel.getMockDataEvents(date: getTodayDate()),
    ActivityModel.getMockDataTransaction(date: getTodayDate()),
  ];
  List<ActivityModel> filteredActivities = [
    ActivityModel.getMockDataTransaction(date: getTodayDate()),
    ActivityModel.getMockDataOutreaches(date: getTodayDate()),
    ActivityModel.getMockDataEvents(date: getTodayDate()),
    ActivityModel.getMockDataTransaction(date: getTodayDate()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: WidgetStyling.buildTopAppBar(title: "Activities"),
      endDrawer: DrawersMobile(),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: focusedDay,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            selectedDayPredicate: (day) => isSameDay(selectedDay, day),
            onDaySelected: (currentSelectedDay, currentFocusedDay) {
              setState(() {
                selectedDay = currentSelectedDay;
                focusedDay = currentFocusedDay;
                if (isSameDay(focusedDay, DateTime.now())) {
                  filteredActivities = activities;
                } else {
                  filteredActivities = [];
                }
              });
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.tealAccent.shade700,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.teal,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
          ),
          HorizontalFilterList(
            filters: filters,
            selectedIndex: filters.indexWhere((f) => f.label == selectedFilter.label),
            onSelect: (filter) async {
              if (filter.label == selectedFilter.label) return;

              setState(() {
                selectedFilter = filter;
              });
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: filteredActivities.isEmpty
                  ? WidgetStyling.getNoDataContainerWith(
                      "There is no ${selectedFilter.label} activities for this filter")
                  : Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children: filteredActivities
                          .where((activity) =>
                              selectedFilter.label == "All" || isActivityTypeEqualToSelectedFilter(activity.type))
                          .map(
                            (activity) => ActivityCard(
                              updateActivityListEvent: () {},
                              activity: activity,
                            ),
                          )
                          .toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  bool isActivityTypeEqualToSelectedFilter(String type) {
    if (selectedFilter.label == "All") return true;
    return selectedFilter.value.toLowerCase() == type.toLowerCase();
  }
}

String getTodayDate() {
  final now = DateTime.now();
  final formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(now);
}
