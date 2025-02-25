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
      appBar: widget.showAppBar ? WidgetStyling.buildTopAppBar(title: "settings".translate(context)) : null,
      endDrawer: DrawersMobile().withAnimation(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WidgetStyling.buildPageTitle("settings".translate(context))
                .withPadding(EdgeInsets.symmetric(horizontal: 20)),
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
                Sans(isDarkMode ? "dark_mode".translate(context) : "light_mode".translate(context), 16),
              ],
            ).withPadding(EdgeInsets.only(left: 13, right: 20)),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildTile(0, Icons.account_circle, "account".translate(context),
                        "manage_account".translate(context), isDarkMode),
                    buildTile(1, Icons.notifications, "notifications".translate(context),
                        "notification_preferences".translate(context), isDarkMode),
                    buildTile(
                        2, Icons.lock, "privacy".translate(context), "privacy_settings".translate(context), isDarkMode),
                    buildTile(3, Icons.language, "language".translate(context),
                            "selectedLanguage".translate(context, isCaseInsensitive: false), isDarkMode)
                        .onTapDown((details) {
                      showLanguagePickerMenu(context, details);
                    }),
                    buildTile(4, Icons.help, "help_support".translate(context), "help_support_text".translate(context),
                        isDarkMode, onTap: () {
                      Navigator.of(context, rootNavigator: true).pushNamed('/manual');
                    }),
                    buildTile(5, Icons.info, "about".translate(context), "app_info".translate(context), isDarkMode,
                        onTap: () => showAppInfoDialog(isDarkMode: isDarkMode)),
                  ],
                ),
              ),
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

  Widget buildTile(int index, IconData icon, String title, String subtitle, bool isDarkMode, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: isDarkMode ? Colors.white : Colors.teal),
      title: Sans(title, 16, color: isDarkMode ? Colors.grey.shade400 : Colors.grey, fontWeight: FontWeight.w500),
      subtitle: Sans(subtitle, 15, color: isDarkMode ? Colors.white : Colors.black87),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap != null
          ? () {
              onTap();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${"tapped_on".translate(context)} $title')),
              );
            }
          : null,
    );
  }

  void showAppInfoDialog({required bool isDarkMode}) async {
    final packageInfo = await PackageInfo.fromPlatform();
    if (!mounted) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDarkMode ? AppColors.darkGray : AppColors.lightTeal,
        titleTextStyle: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black,
          fontSize: 20,
        ),
        contentTextStyle: TextStyle(
          color: isDarkMode ? Colors.grey.shade200 : Colors.black87,
          fontSize: 16,
        ),
        title: Text("app_info_title".translate(context)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${"version".translate(context)}: ${packageInfo.version}'),
            Text('${"build_number".translate(context)}: ${packageInfo.buildNumber}'),
            Text('${"package_name".translate(context)}: ${packageInfo.packageName}'),
            Text('${"app_name".translate(context)}: ${packageInfo.appName}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: isDarkMode ? Colors.grey.shade50 : Colors.teal,
            ),
            child: Text("close".translate(context)),
          ),
        ],
      ),
    );
  }

  void showLanguagePickerMenu(BuildContext context, TapDownDetails details) {
    final screenSize = MediaQuery.of(context).size;

    List<String> languages = [
      'English'.translate(context),
      'French'.translate(context),
      'Hebrew'.translate(context),
      'Spanish'.translate(context),
    ];

    String currentLanguage = "selectedLanguage".translate(context, isCaseInsensitive: false);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        screenSize.width - details.globalPosition.dx,
        screenSize.height - details.globalPosition.dy,
      ),
      color: context.isDarkMode ? Colors.black87 : AppColors.lightTeal,
      items: languages.map((language) {
        return PopupMenuItem(
          value: language,
          child: Row(
            children: [
              Text(language),
              if (language == currentLanguage) ...[
                SizedBox(width: 10),
                Icon(Icons.check, color: context.isDarkMode ? Colors.white : Colors.black),
              ],
            ],
          ),
        );
      }).toList(),
    ).then((selected) {
      if (selected != null) {
        Locale selectedLocale;

        if (selected == languages[0]) {
          selectedLocale = Locale('en');
        } else if (selected == languages[1]) {
          selectedLocale = Locale('fr');
        } else if (selected == languages[2]) {
          selectedLocale = Locale('he');
        } else if (selected == languages[3]) {
          selectedLocale = Locale('es');
        } else {
          selectedLocale = Locale('en');
        }

        // if (mounted) {
        final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
        localeProvider.setLocale(selectedLocale);
        localeProvider.saveLocale();
        // }
      }
    });
  }
}
