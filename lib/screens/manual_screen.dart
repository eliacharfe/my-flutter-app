import 'package:eliachar_feig/packages/ui_components_packages.dart';
import 'package:eliachar_feig/packages/utlis_packages.dart';
import '../packages/default_packages.dart';

class ManualScreen extends StatefulWidget {
  final bool showAppBar;
  const ManualScreen({super.key, this.showAppBar = true});

  @override
  ManualScreenState createState() => ManualScreenState();
}

class ManualScreenState extends State<ManualScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;

    return Scaffold(
      backgroundColor: context.scaffoldColor,
      appBar: widget.showAppBar ? WidgetStyling.buildTopAppBar(title: "Manual") : null,
      endDrawer: DrawersMobile(),
      body: Column(
        children: [
          WidgetStyling.buildPageTitle('Manual').withPadding(EdgeInsets.symmetric(horizontal: 20)),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: featureCategories.length,
              itemBuilder: (context, index) {
                final category = featureCategories[index];
                return buildFeatureSection(category, isDarkMode);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFeatureSection(FeatureCategory category, bool isDarkMode) {
    return Card(
      color: isDarkMode ? Colors.grey.shade900 : AppColors.lightTeal,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(category.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Column(
              children: category.features
                  .asMap()
                  .entries
                  .map((entry) => FeatureItem(feature: entry.value, delay: entry.key * 300)) // Delay each item by 300ms
                  .toList(),
            ),
          ],
        ),
      ),
    ).withAnimation();
  }
}

class FeatureItem extends StatefulWidget {
  final AppFeature feature;
  final int delay;

  const FeatureItem({super.key, required this.feature, required this.delay});

  @override
  FeatureItemState createState() => FeatureItemState();
}

class FeatureItemState extends State<FeatureItem> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.feature.label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 4),
                Text(widget.feature.description, style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureCategory {
  final String title;
  final List<AppFeature> features;

  FeatureCategory({required this.title, required this.features});
}

class AppFeature {
  final String label;
  final String description;

  AppFeature({required this.label, required this.description});
}

// Mock Data
final List<FeatureCategory> featureCategories = [
  FeatureCategory(
    title: "Transactions",
    features: [
      AppFeature(label: "Quick Transactions", description: "Easily manage your transactions."),
      AppFeature(label: "Secure Payments", description: "Encrypted transactions for safety."),
    ],
  ),
  FeatureCategory(
    title: "Appointments",
    features: [
      AppFeature(label: "Schedule Appointments", description: "Book and manage appointments."),
      AppFeature(label: "Reminders", description: "Get notified about upcoming events."),
    ],
  ),
  FeatureCategory(
    title: "Notifications",
    features: [
      AppFeature(label: "Real-time Alerts", description: "Stay updated instantly."),
      AppFeature(label: "Custom Notifications", description: "Set preferences for alerts."),
    ],
  ),
  FeatureCategory(
    title: "User Guide",
    features: [
      AppFeature(label: "Step-by-Step Tutorials", description: "Learn how to use all features."),
      AppFeature(label: "FAQ", description: "Find answers to common questions."),
    ],
  ),
];
