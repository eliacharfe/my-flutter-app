import 'package:eliachar_feig/ui_components/extensions/widget_extensions.dart';
import 'package:eliachar_feig/ui_components/styling/widget_styling.dart';
import 'package:eliachar_feig/utils/app_colors.dart';
import 'package:eliachar_feig/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsPage extends StatefulWidget {
  final bool showAppBar;
  const SettingsPage({super.key, this.showAppBar = true});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                const SettingsTile(
                  icon: Icons.account_circle,
                  title: 'Account',
                  subtitle: 'Manage your account settings',
                ),
                const SettingsTile(
                  icon: Icons.notifications,
                  title: 'Notifications',
                  subtitle: 'Set your notification preferences',
                ),
                const SettingsTile(
                  icon: Icons.lock,
                  title: 'Privacy',
                  subtitle: 'Adjust your privacy settings',
                ),
                const SettingsTile(
                  icon: Icons.language,
                  title: 'Language',
                  subtitle: 'Change your app language',
                ),
                const SettingsTile(
                  icon: Icons.help,
                  title: 'Help & Support',
                  subtitle: 'Get help and support',
                ),
                const SettingsTile(
                  icon: Icons.info,
                  title: 'About',
                  subtitle: 'App version and information',
                ),
              ],
            ),
            // Version at the bottom
            Text(
              appVersion,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
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
