import 'package:eliachar_feig/packages/default_packages.dart';
import '../packages/ui_components_packages.dart';
import '../packages/utlis_packages.dart';

class TermsPage extends StatelessWidget {
  final bool showAppBar;
  TermsPage({super.key, this.showAppBar = true});

  final sectionTitleStyle = GoogleFonts.openSans(fontSize: 17.5, color: Colors.grey);
  final bulletPointSubHeadlineStyle = TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: showAppBar ? WidgetStyling.buildTopAppBar(title: 'Terms') : null,
      endDrawer: DrawersMobile(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            WidgetStyling.buildPageTitle('Privacy Policy & Terms of Service'),
            buildTerms(),
          ],
        ),
      ),
    );
  }

  Column buildTerms() {
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
        
        Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes."""),
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
        
        Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. """),
                  TextSpan(text: "\n\n\n"),
                  TextSpan(text: '• Eliachar App', style: bulletPointSubHeadlineStyle),
                  TextSpan(text: '\n\n'),
                  TextSpan(
                      text:
                          """Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. 
        
        Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. 
        
        Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes.  """),
                  TextSpan(text: '\n\n\n'),
                  buildTermsHeadline('Information we collect automatically'),
                  TextSpan(text: '\n\n', style: TextStyle(height: 0.5)),
                  TextSpan(
                      text:
                          'Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. '),
                  TextSpan(text: '\n\n\n'),
                  TextSpan(text: '• Cookies and Similar Technology', style: bulletPointSubHeadlineStyle),
                  TextSpan(text: '\n\n'),
                  TextSpan(
                      text:
                          """“Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. 
         
        Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. """),
                  TextSpan(text: '\n\n\n'),
                  TextSpan(text: '• Clickstream Data', style: bulletPointSubHeadlineStyle),
                  TextSpan(text: '\n\n'),
                  TextSpan(
                      text:
                          """Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. """),
                  TextSpan(text: '\n\n\n'),
                  TextSpan(text: '• Website Analytics', style: bulletPointSubHeadlineStyle),
                  TextSpan(text: '\n\n'),
                  TextSpan(
                      text:
                          """Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes.  
        
        Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. """),
                  TextSpan(text: '\n\n\n'),
                ]),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        SizedBox(height: 10),
        buildBulletPointRow(
            'Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans.'),
        SizedBox(height: 10),
        buildBulletPointRow(
            'Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans.'),
        SizedBox(height: 10),
        buildBulletPointRow(
            'Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans.'),
        SizedBox(height: 10),
        buildBulletPointRow(
            'Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans.'),
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
                  buildTermsHeadline('Changes to our privacy policy'),
                  TextSpan(text: '\n\n', style: TextStyle(height: 0.5)),
                  TextSpan(
                      text:
                          "Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans."),
                  TextSpan(text: '\n\n\n'),
                  buildTermsHeadline("Children's privacy"),
                  TextSpan(text: '\n\n', style: TextStyle(height: 0.5)),
                  TextSpan(
                      text:
                          "Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans."),
                  TextSpan(text: '\n\n\n'),
                  buildTermsHeadline('Cross-Border data transfers'),
                  TextSpan(text: '\n\n', style: TextStyle(height: 0.5)),
                  TextSpan(
                      text:
                          "Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans."),
                  TextSpan(text: '\n\n\n'),
                  buildTermsHeadline('Contact Me'),
                  TextSpan(text: '\n\n', style: TextStyle(height: 0.5)),
                  TextSpan(
                      text:
                          """Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans.

Eliachar Feig
128 Willowbrook Lane
Fairview, CA 90210
United States
Email: efeig15@gmail.com"""),
                ]),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  fontWeight: FontWeight.w300,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 30),
      ],
    );
  }

  TextSpan buildTermsHeadline(String text) {
    return TextSpan(text: text, style: sectionTitleStyle);
  }

  Row buildBulletPointRow(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("• "),
        Expanded(
          child: Text(text,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              )),
        ),
      ],
    );
  }
}
