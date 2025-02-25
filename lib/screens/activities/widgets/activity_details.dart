import 'package:eliachar_feig/models/activity_model.dart';
import 'package:eliachar_feig/packages/default_packages.dart';
import 'package:eliachar_feig/packages/utlis_packages.dart';
import 'package:eliachar_feig/screens/activities/widgets/activity_card.dart';
import 'package:eliachar_feig/ui_components/icon_with_text.dart';
import 'package:eliachar_feig/ui_components/wide_rect_button.dart';
import '../../../packages/ui_components_packages.dart';

class ActivityDetails extends StatefulWidget {
  final ActivityModel activity;
  final Function(Map<String, dynamic> data) editAction;
  final Function() deleteAction;
  const ActivityDetails({
    super.key,
    required this.activity,
    required this.editAction,
    required this.deleteAction,
  });

  @override
  State<ActivityDetails> createState() => _ActivityDetailsState();
}

class _ActivityDetailsState extends State<ActivityDetails> {
  bool isLoading = false;
  late ActivityModel activityModel;

  @override
  void initState() {
    super.initState();
    activityModel = widget.activity;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return Scaffold(
        appBar: WidgetStyling.buildTopAppBar(
            title: isLoading ? "" : "${activityModel.type.capitalizeWords()} Details",
            context: context,
            showLogoIcon: false),
        backgroundColor: context.scaffoldColor,
        body: isLoading
            ? WidgetStyling.getLoader()
            : Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Scrollbar(
                          controller: controller,
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            controller: controller,
                            child: WidgetStyling.getContainerFor(
                              isDarkMode: context.isDarkMode,
                              widgetList: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 25),
                                    SansBold(activityModel.title.capitalizeWords(), 18),
                                    const SizedBox(height: 20),
                                    Visibility(
                                      visible: (activityModel.badgeStatus ?? "").isNotEmpty,
                                      child: Column(
                                        children: [
                                          RoundTextDisplay(
                                            text: activityModel.badgeStatus.capitalizeWords(),
                                            bgColor: Colors.white,
                                            textColor: ActivityStaticData.getColorByStatus(
                                                activityModel.badgeStatus.toLowerCase()),
                                            borderColor: ActivityStaticData.getColorByStatus(
                                                activityModel.badgeStatus.toLowerCase()),
                                            borderRadius: 15,
                                            fontSize: 12,
                                            isBold: false,
                                          ),
                                          const SizedBox(height: 12),
                                        ],
                                      ),
                                    ),
                                    IconWithText(
                                      iconData: Icons.calendar_today,
                                      text: getDateString() ?? "",
                                      textWidth: 200,
                                      color: context.isDarkMode ? Colors.white : Colors.black,
                                    ),
                                    const SizedBox(height: 12),
                                    IconWithText(
                                      iconData: Icons.person_outline_rounded,
                                      text: activityModel.authorName.capitalizeWords(),
                                      textWidth: 200,
                                      color: context.isDarkMode ? Colors.white : Colors.black,
                                    ),
                                    if (activityModel.type.toLowerCase() != ActivityStaticData.outreaches)
                                      Container(
                                        color: context.isDarkMode ? AppColors.darkGray : AppColors.scaffoldColor,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 30),
                                            Sans(
                                              "Description",
                                              14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey,
                                            ),
                                            const SizedBox(height: 8),
                                            Sans(
                                              activityModel.description.capitalizeFirstLetter(),
                                              15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                              emptyContainerText: "",
                            ),
                          ).responsive(context),
                        ),
                      ),
                      if (activityModel.type.toLowerCase() == ActivityStaticData.events)
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: buildMarkAsCompleteButton(
                            context: context,
                          ),
                        )
                    ],
                  ),
                ],
              ));
  }

  String? getDateString() {
    if ((activityModel.startTime ?? "").isNotEmpty) {
      return "${activityModel.date} · ${activityModel.startTime ?? ""}";
    }
    return activityModel.date;
  }

  Widget buildMarkAsCompleteButton({
    required BuildContext context,
  }) {
    return WideRectButton(
      bgColor: Colors.black,
      borderColor: Colors.black,
      textColor: Colors.white,
      isEnabled: activityModel.completionStatus != "Completed",
      loaderColor: Colors.white,
      width: context.isLargeDevice ? 420 : null,
      text: "Mark As Completed",
      onPressed: () async {
        setState(() {
          isLoading = true;
        });
        await Future.delayed(const Duration(milliseconds: 2000));
        setState(() {
          isLoading = false;
          activityModel.completionStatus = "Completed";
        });
      },
    );
  }
}
