import 'package:eliachar_feig/packages/default_packages.dart';
import '../packages/ui_components_packages.dart';
import '../packages/utlis_packages.dart';

class SettingsPage extends StatefulWidget {
  final bool showAppBar;
  const SettingsPage({super.key, this.showAppBar = true});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with SingleTickerProviderStateMixin {
  String appVersion = "Unknown";

  @override
  void initState() {
    super.initState();
    getVersion();
  }

  Future<void> getVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = 'Version ${packageInfo.version} (${packageInfo.buildNumber})';
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = context.isDarkMode;

    return Scaffold(
      backgroundColor: context.scaffoldColor,
      appBar: widget.showAppBar ? WidgetStyling.buildTopAppBar(title: 'Settings') : null,
      endDrawer: DrawersMobile().withAnimation(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetStyling.buildPageTitle('Settings').withPadding(EdgeInsets.symmetric(horizontal: 20)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Switch(
                      value: isDarkMode,
                      activeColor: Colors.white,
                      activeTrackColor: Colors.black,
                      inactiveThumbColor: Colors.black,
                      inactiveTrackColor: Colors.white,
                      onChanged: (value) {
                        themeProvider.toggleTheme(value);
                      },
                    ),
                    SizedBox(width: 10),
                    Sans(isDarkMode ? "Dark Mode 🌙" : "Light Mode ☀️", 16),
                  ],
                ).withPadding(EdgeInsets.only(left: 13, right: 20)),
                animatedSettingsTile(0, Icons.account_circle, 'Account', 'Manage your account settings', isDarkMode),
                animatedSettingsTile(
                    1, Icons.notifications, 'Notifications', 'Set your notification preferences', isDarkMode),
                animatedSettingsTile(2, Icons.lock, 'Privacy', 'Adjust your privacy settings', isDarkMode),
                animatedSettingsTile(3, Icons.language, 'Language', 'Change your app language', isDarkMode),
                animatedSettingsTile(4, Icons.help, 'Help & Support', 'Get help and support', isDarkMode),
                animatedSettingsTile(5, Icons.info, 'About', 'App version and information', isDarkMode),
              ],
            ),
            Text(
              appVersion,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ).withAnimation(duration: Duration(milliseconds: widget.showAppBar ? 1000 : 1500)),
    );
  }

  Widget animatedSettingsTile(int index, IconData icon, String title, String subtitle, bool isDarkMode) {
    return ListTile(
      leading: Icon(icon, color: isDarkMode ? Colors.white : Colors.teal),
      title: Sans(title, 16, color: isDarkMode ? Colors.grey.shade400 : Colors.grey, fontWeight: FontWeight.w500),
      subtitle: Sans(subtitle, 15, color: isDarkMode ? Colors.white : Colors.black87),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tapped on $title')),
        );
      },
    );
  }
}
