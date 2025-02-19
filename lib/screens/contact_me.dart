import 'package:eliachar_feig/constants/app_colors.dart';
import 'package:eliachar_feig/ui_components/styling/widget_styling.dart';
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
      appBar: showAppBar ? WidgetStyling.buildTopAppBar() : null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetStyling.buildPageTitle('Contact Me'),
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
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.blueGrey),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(fontSize: 15, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
