import 'package:eliachar_feig/models/activity_model.dart';
import 'package:eliachar_feig/models/filters.dart';
import 'package:eliachar_feig/packages/ui_components_packages.dart';
import 'package:eliachar_feig/screens/activities/widgets/activity_card.dart';
import 'package:eliachar_feig/ui_components/horizontal_filter_list.dart';
import 'package:flutter/rendering.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../packages/default_packages.dart';
import '../../packages/utlis_packages.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  ActivitiesState createState() => ActivitiesState();
}

class ActivitiesState extends State<Activities> with SingleTickerProviderStateMixin {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  Filters selectedFilter = Filters(value: "all", label: "All", isSelected: true);
  List<ActivityModel> filteredActivities = [];
  // Mock Data
  final List<ActivityModel> activities = [
    ActivityModel.getMockDataTransaction(date: DateHelper.getTodayDate()),
    ActivityModel.getMockDataOutreaches(date: DateHelper.getTodayDate()),
    ActivityModel.getMockDataEvents(date: DateHelper.getTodayDate()),
    ActivityModel.getMockDataTransaction(date: DateHelper.getTodayDate()),
    ActivityModel.getMockDataTransaction(date: DateHelper.getTodayDate()),
    ActivityModel.getMockDataOutreaches(date: DateHelper.getTodayDate()),
    ActivityModel.getMockDataEvents(date: DateHelper.getTodayDate()),
    ActivityModel.getMockDataTransaction(date: DateHelper.getTodayDate()),
  ];
  bool isCalendarExpanded = true;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selectedFilter = Filters(value: "all", label: "All".translate(context), isSelected: true);

        filteredActivities = List.from(activities);
      });
    });

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (isCalendarExpanded) {
          setState(() {
            isCalendarExpanded = false;
          });
        }
      } else if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (!isCalendarExpanded) {
          setState(() {
            isCalendarExpanded = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;
    final List<Filters> filters = [
      Filters(value: "all", label: "All".translate(context), isSelected: false),
      Filters(value: "transaction", label: "Transactions".translate(context), isSelected: false),
      Filters(value: "events", label: "Events".translate(context), isSelected: false),
      Filters(value: "outreaches", label: "Outreaches".translate(context), isSelected: false),
    ];

    return Scaffold(
      backgroundColor: context.scaffoldColor,
      appBar: WidgetStyling.buildTopAppBar(title: "Activities".translate(context)),
      endDrawer: DrawersMobile(),
      body: Column(
        children: [
          SizedBox(
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(isCalendarExpanded ? Icons.expand_less : Icons.expand_more)
                    .withPadding(EdgeInsets.only(left: 10, top: 5)),
                Spacer(),
                Sans(isCalendarExpanded ? 'Hide'.translate(context) : 'Show'.translate(context), 14),
                Spacer(),
                Icon(Icons.event),
              ],
            ),
          ).withPadding(EdgeInsets.only(right: 10, top: 5)).onTapWithCursor(() {
            setState(() {
              isCalendarExpanded = !isCalendarExpanded;
            });
          }),
          AnimatedSize(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: isCalendarExpanded
                ? SizedBox(
                    height: 280,
                    child: TableCalendar(
                      shouldFillViewport: true,
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
                        todayDecoration: BoxDecoration(color: Colors.teal, shape: BoxShape.circle),
                      ),
                      headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
                    ).withAnimation(),
                  )
                : SizedBox(height: 25),
          ),
          SizedBox(height: 15),
          HorizontalFilterList(
            filters: filters,
            selectedIndex:
                filters.indexWhere((f) => f.label.translate(context) == selectedFilter.label.translate(context)),
            onSelect: (filter) async {
              if (filter.label == selectedFilter.label) return;
              setState(() {
                selectedFilter = filter;
              });
            },
            isDarkMode: isDarkMode,
          ),
          SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: filteredActivities.isEmpty
                  ? WidgetStyling.getNoDataContainerWith(
                      "There is no ${selectedFilter.label} activities for this filter",
                      isDarkMode: isDarkMode,
                    )
                  : Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children: filteredActivities
                          .where(
                            (activity) =>
                                selectedFilter.label == "All".translate(context) ||
                                isActivityTypeEqualToSelectedFilter(context, activity.type),
                          )
                          .map((activity) => ActivityCard(updateActivityListEvent: () {}, activity: activity))
                          .toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  bool isActivityTypeEqualToSelectedFilter(BuildContext context, String type) {
    if (selectedFilter.label == "All".translate(context)) return true;
    return selectedFilter.value.toLowerCase() == type.toLowerCase();
  }
}
