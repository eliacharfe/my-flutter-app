import '../packages/default_packages.dart';
import '../packages/ui_components_packages.dart';
import '../packages/utlis_packages.dart';

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
              value: '+972 581234567',
              onTap: () async {
                Uri phone = Uri.parse('tel: 0581234567');
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
              value: '+972 581234567',
              onTap: () async {
                final Uri whatsapp = Uri.parse('https://api.whatsapp.com/send?phone=972581234567');
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
