import '../packages/default_packages.dart';
import '../packages/ui_components_packages.dart';
import '../packages/utlis_packages.dart';

class ContactMe extends StatefulWidget {
  final bool showAppBar;
  const ContactMe({super.key, this.showAppBar = true});

  @override
  ContactMeState createState() => ContactMeState();
}

class ContactMeState extends State<ContactMe> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.showAppBar ? 1000 : 1500),
    );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: widget.showAppBar ? WidgetStyling.buildTopAppBar(title: 'Contact Me') : null,
      endDrawer: DrawersMobile(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetStyling.buildPageTitle('Contact Me').withPadding(const EdgeInsets.symmetric(horizontal: 20)),
            const SizedBox(height: 10),
            animatedContactItem(
              index: 0,
              icon: Icons.phone,
              label: 'Phone',
              value: '+972 581234567',
              onTap: () async {
                Uri phone = Uri.parse('tel:0581234567');
                if (await launchUrl(phone)) {}
              },
            ),
            animatedContactItem(
              index: 1,
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
            animatedContactItem(
              index: 2,
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
            animatedContactItem(
              index: 3,
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
            animatedContactItem(
              index: 4,
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

  Widget animatedContactItem({
    required int index,
    required IconData icon,
    required String label,
    required String value,
    bool tappable = true,
    VoidCallback? onTap,
  }) {
    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 200),
          scale: 1.0,
          child: GestureDetector(
            onTapDown: (_) {
              if (tappable) {
                setState(() => animationController.reverse(from: 0.9));
              }
            },
            onTapUp: (_) {
              if (tappable) {
                setState(() => animationController.forward());
              }
              if (onTap != null) onTap();
            },
            child: ListTile(
              leading: Icon(icon, color: Colors.teal),
              title: Text(label, style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500)),
              subtitle: Text(value, style: TextStyle(fontSize: 15, color: Colors.black87)),
              trailing: tappable ? const Icon(Icons.chevron_right) : null,
              onTap: onTap,
            ),
          ),
        ),
      ),
    );
  }
}
