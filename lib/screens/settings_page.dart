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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: widget.showAppBar ? WidgetStyling.buildTopAppBar(title: 'Settings') : null,
      endDrawer: DrawersMobile(),
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
                animatedSettingsTile(0, Icons.account_circle, 'Account', 'Manage your account settings'),
                animatedSettingsTile(1, Icons.notifications, 'Notifications', 'Set your notification preferences'),
                animatedSettingsTile(2, Icons.lock, 'Privacy', 'Adjust your privacy settings'),
                animatedSettingsTile(3, Icons.language, 'Language', 'Change your app language'),
                animatedSettingsTile(4, Icons.help, 'Help & Support', 'Get help and support'),
                animatedSettingsTile(5, Icons.info, 'About', 'App version and information'),
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

  Widget animatedSettingsTile(int index, IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Sans(title, 16, color: Colors.grey, fontWeight: FontWeight.w500),
      subtitle: Sans(subtitle, 15, color: Colors.black87),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tapped on $title')),
        );
      },
    );
  }
}
