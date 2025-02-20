import 'package:eliachar_feig/ui_components/extensions/widget_extensions.dart';
import 'package:eliachar_feig/ui_components/styling/widget_styling.dart';
import 'package:eliachar_feig/utils/app_colors.dart';
import 'package:eliachar_feig/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactMe extends StatelessWidget {
  final bool showAppBar;
  const ContactMe({super.key, this.showAppBar = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: showAppBar ? WidgetStyling.buildTopAppBar(title: 'Contact Me') : null,
      endDrawer: DrawersMobile(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetStyling.buildPageTitle('Contact Me').withPadding(EdgeInsets.symmetric(horizontal: 20)),
            buildContactItem(
              icon: Icons.phone,
              label: 'Phone',
              value: '+972 587272372',
              onTap: () async {
                Uri phone = Uri.parse('tel: 0587272372');
                if (await launchUrl(phone)) {}
              },
            ),
            buildContactItem(
              icon: Icons.email,
              label: 'Email',
              value: 'efeig15@gmail.com',
              onTap: () async {
                final Uri email = Uri.parse('mailto:efeig15@gmail.com');
                if (await canLaunchUrl(email)) {
                  await launchUrl(email);
                }
              },
            ),
            buildContactItem(
              icon: FontAwesomeIcons.whatsapp,
              label: 'WhatsApp',
              value: '+972 587272372',
              onTap: () async {
                final Uri whatsapp = Uri.parse('https://api.whatsapp.com/send?phone=972587272372');
                if (await canLaunchUrl(whatsapp)) {
                  await launchUrl(whatsapp);
                }
              },
            ),
            buildContactItem(
              icon: Icons.language,
              label: 'Website',
              value: 'www.eliacharfeig.com',
              onTap: () async {
                final Uri url = Uri.parse('https://www.eliacharfeig.com/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
            ),
            buildContactItem(
              icon: Icons.location_on,
              label: 'Address',
              value: '128 Willowbrook Lane, Fairview, CA 90210, United States',
              tappable: false,
              onTap: null,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContactItem({
    required IconData icon,
    required String label,
    required String value,
    bool tappable = true,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Sans(label, 16, color: Colors.grey, fontWeight: FontWeight.w500),
      subtitle: Sans(value, 15, color: Colors.black87),
      trailing: tappable ? const Icon(Icons.chevron_right) : null,
      onTap: tappable ? onTap : null,
    );
  }
}
