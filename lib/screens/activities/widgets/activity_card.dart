import 'package:eliachar_feig/models/activity_model.dart';
import 'package:eliachar_feig/packages/ui_components_packages.dart';
import 'package:eliachar_feig/packages/utlis_packages.dart';
import 'package:eliachar_feig/screens/activities/widgets/activity_details.dart';
import 'package:eliachar_feig/ui_components/extensions/string_extensions.dart';

import '../../../packages/default_packages.dart';

class ActivityCard extends StatelessWidget {
  final ActivityModel activity;
  final Function()? updateActivityListEvent;
  const ActivityCard({
    super.key,
    required this.activity,
    this.updateActivityListEvent,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;

    return Container(
      decoration: BoxDecoration(
          color: isDarkMode ? AppColors.darkGray : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.transparent,
          )),
      padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
      child: prepareActivityWidget(isDarkMode).withAnimation(),
    ).onTapWithCursor(
      () {
        Navigator.of(context).push(
          RouteWrapper(
            page: ActivityDetails(
              activity: activity,
              editAction: (_) {},
              deleteAction: () {},
            ),
          ),
        );
      },
      key: activity.id,
    );
  }

  Column prepareActivityWidget(bool isDarkMode) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                activity.title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: RoundTextDisplay(
                text: activity.type.capitalizeWords(),
                bgColor: ActivityStaticData.getColorByType(activity.type.toLowerCase()),
                textColor: Colors.white,
                borderRadius: 15,
                fontSize: 12,
                isBold: false,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Icon(
              Icons.calendar_today,
              size: 13,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              activity.date,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Visibility(
                visible: (activity.startTime ?? "").isNotEmpty,
                child: Text(
                  " · ${activity.startTime ?? ""}",
                  style: const TextStyle(fontSize: 13),
                )),
            const Spacer(),
            if ((activity.badgeStatus ?? "").isNotEmpty)
              RoundTextDisplay(
                text: activity.badgeStatus.capitalizeWords(),
                bgColor: Colors.white,
                borderColor: ActivityStaticData.getColorByStatus((activity.badgeStatus ?? "").toLowerCase()),
                textColor: ActivityStaticData.getColorByStatus((activity.badgeStatus ?? "").toLowerCase()),
                borderRadius: 15,
                fontSize: 12,
                isBold: false,
              ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(Icons.person_outline, size: 16, color: isDarkMode ? Colors.white : Color.fromRGBO(0, 0, 0, 0.59)),
            const SizedBox(
              width: 5,
            ),
            Sans(
              activity.authorName,
              14,
              color: isDarkMode ? Colors.white : Color.fromRGBO(0, 0, 0, 0.59),
            ),
            Visibility(
                visible: (activity.location ?? "").isNotEmpty,
                child: Expanded(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.storefront,
                        size: 13,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(activity.location ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(0, 0, 0, 0.59),
                              fontWeight: FontWeight.w500,
                            )),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ],
    );
  }
}

class ActivityStaticData {
  static const String events = "events";
  static const String outreaches = "outreaches";
  static const String transaction = "transaction";

  static Color getColorByType(String type) {
    String formatedStatus = type.toLowerCase();
    switch (formatedStatus) {
      case events:
        return const Color.fromRGBO(55, 78, 160, 1);
      case outreaches:
        return const Color.fromRGBO(95, 113, 179, 1);
      case transaction:
        return const Color.fromRGBO(191, 168, 101, 1);
      default:
        return Colors.white;
    }
  }

  static Color getColorByStatus(String status) {
    String formatedStatus = status.toLowerCase();
    switch (formatedStatus) {
      case "manual record":
        return const Color.fromRGBO(55, 78, 160, 1);
      case "completed":
        return const Color.fromRGBO(1, 126, 82, 1);
    }
    return Colors.white;
  }
}
