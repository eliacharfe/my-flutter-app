import 'package:eliachar_feig/packages/default_packages.dart';
import '../packages/ui_components_packages.dart';
import '../packages/utlis_packages.dart';

class TermsPage extends StatefulWidget {
  final bool showAppBar;
  const TermsPage({super.key, this.showAppBar = true});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;
    final sectionTitleStyle =
        GoogleFonts.openSans(fontSize: 17.5, color: isDarkMode ? Colors.grey.shade200 : Colors.grey);
    final bulletPointSubHeadlineStyle =
        TextStyle(color: isDarkMode ? Colors.grey.shade200 : Colors.black, fontSize: 15, fontWeight: FontWeight.w500);
    final textStyle =
        TextStyle(fontSize: 15, color: isDarkMode ? Colors.white : Colors.black87, fontWeight: FontWeight.w300);

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.darkGray : AppColors.scaffoldColor,
      appBar: widget.showAppBar ? WidgetStyling.buildTopAppBar(title: 'Terms') : null,
      endDrawer: DrawersMobile(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            WidgetStyling.buildPageTitle('Privacy Policy & Terms of Service'),
            buildTerms(sectionTitleStyle, textStyle, bulletPointSubHeadlineStyle),
          ],
        ).withAnimation(),
      ),
    );
  }

  Column buildTerms(TextStyle sectionTitleStyle, TextStyle textStyle, TextStyle bulletPointStyle) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            Flexible(
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(text: 'Introduction', style: sectionTitleStyle),
                  TextSpan(text: '\n\n', style: TextStyle(height: 0.5)),
                  TextSpan(
                    text:
                        """Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes.
        
        Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. 
        
        Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes.""",
                    style: textStyle,
                  ),
                  TextSpan(text: '\n\n\n'),
                  TextSpan(text: 'Overview', style: sectionTitleStyle),
                  TextSpan(text: '\n\n', style: TextStyle(height: 0.5)),
                  TextSpan(
                      text:
                          """• Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes."""),
                  TextSpan(text: "\n\n\n"),
                  TextSpan(text: "Information we collect directly from you", style: sectionTitleStyle),
                  TextSpan(text: '\n\n', style: TextStyle(height: 0.5)),
                  TextSpan(
                    text:
                        """“Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. 
        
        Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. """,
                    style: textStyle,
                  ),
                  TextSpan(text: "\n\n\n"),
                  TextSpan(text: '• Eliachar App', style: bulletPointStyle),
                  TextSpan(text: '\n\n'),
                  TextSpan(
                    text:
                        """Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. 
        
        Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. 
        
        Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes.  """,
                    style: textStyle,
                  ),
                  TextSpan(text: '\n\n\n'),
                  buildTermsHeadline('Information we collect automatically', sectionTitleStyle),
                  TextSpan(text: '\n\n', style: TextStyle(height: 0.5)),
                  TextSpan(
                    text:
                        'Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. ',
                    style: textStyle,
                  ),
                  TextSpan(text: '\n\n\n'),
                  TextSpan(text: '• Cookies and Similar Technology', style: bulletPointStyle),
                  TextSpan(text: '\n\n'),
                  TextSpan(
                    text:
                        """“Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. 
         
        Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. """,
                    style: textStyle,
                  ),
                  TextSpan(text: '\n\n\n'),
                  TextSpan(text: '• Clickstream Data', style: bulletPointStyle),
                  TextSpan(text: '\n\n'),
                  TextSpan(
                    text:
                        """Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. """,
                    style: textStyle,
                  ),
                  TextSpan(text: '\n\n\n'),
                  TextSpan(text: '• Website Analytics', style: bulletPointStyle),
                  TextSpan(text: '\n\n'),
                  TextSpan(
                    text:
                        """Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes.  
        
        Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. """,
                    style: textStyle,
                  ),
                  TextSpan(text: '\n\n\n'),
                ]),
                style: textStyle,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        SizedBox(height: 10),
        buildBulletPointRow(
          'Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans.',
          textStyle,
        ),
        SizedBox(height: 10),
        buildBulletPointRow(
          'Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans.',
          textStyle,
        ),
        SizedBox(height: 10),
        buildBulletPointRow(
          'Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans.',
          textStyle,
        ),
        SizedBox(height: 10),
        buildBulletPointRow(
          'Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans.',
          textStyle,
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Flexible(
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text:
                          "Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans."),
                  TextSpan(text: '\n\n\n'),
                  buildTermsHeadline('Changes to our privacy policy', sectionTitleStyle),
                  TextSpan(text: '\n\n', style: TextStyle(height: 0.5)),
                  TextSpan(
                      text:
                          "Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans."),
                  TextSpan(text: '\n\n\n'),
                  buildTermsHeadline("Children's privacy", sectionTitleStyle),
                  TextSpan(text: '\n\n', style: TextStyle(height: 0.5)),
                  TextSpan(
                      text:
                          "Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans."),
                  TextSpan(text: '\n\n\n'),
                  buildTermsHeadline('Cross-Border data transfers', sectionTitleStyle),
                  TextSpan(text: '\n\n', style: TextStyle(height: 0.5)),
                  TextSpan(
                      text:
                          "Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans."),
                  TextSpan(text: '\n\n\n'),
                  buildTermsHeadline('Contact Me', sectionTitleStyle),
                  TextSpan(text: '\n\n', style: TextStyle(height: 0.5)),
                  TextSpan(
                      text:
                          """Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans.

Eliachar Feig
128 Willowbrook Lane
Fairview, CA 90210
United States
Email: efeig15@gmail.com""",
                      style: textStyle),
                ]),
                style: textStyle,
              ),
            )
          ],
        ),
        SizedBox(height: 30),
      ],
    );
  }

  TextSpan buildTermsHeadline(String text, TextStyle sectionTitleStyle) {
    return TextSpan(text: text, style: sectionTitleStyle);
  }

  Row buildBulletPointRow(String text, TextStyle textStyle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("• "),
        Expanded(
          child: Text(text, style: textStyle),
        ),
      ],
    );
  }
}
