import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hartman_web_view/constants/app_colors.dart';

class TermsPage extends StatelessWidget {
  TermsPage({super.key});

  final bulletPointSubHeadlineStyle = TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            buildTitle("Privacy Policy & Terms of Service"),
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
                  TextSpan(text: 'Introduction', style: TextStyle(color: AppColors.hmLightBlue, fontSize: 17.5)),
                  TextSpan(text: '\n\n', style: TextStyle(height: 0.5)),
                  TextSpan(
                      text:
                          """Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. ”
        
        Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. 
        
        Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes."""),
                  TextSpan(text: '\n\n\n'),
                  TextSpan(text: 'Overview', style: TextStyle(color: AppColors.hmLightBlue, fontSize: 17.5)),
                  TextSpan(text: '\n\n', style: TextStyle(height: 0.5)),
                  TextSpan(
                      text:
                          """• Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes."""),
                  TextSpan(text: "\n\n\n"),
                  TextSpan(
                      text: "Information we collect directly from you",
                      style: TextStyle(color: AppColors.hmLightBlue, fontSize: 17.5)),
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
    return TextSpan(
        text: text,
        style: TextStyle(
          color: AppColors.hmLightBlue,
          fontSize: 17.5,
        ));
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

  Widget buildTitle(String title) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 27.5, color: AppColors.hmDarkBlue),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.hmDarkBlue,
      toolbarHeight: 50,
      title: Row(
        children: [
          Spacer(),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(child: SvgPicture.asset('assets/images/hartman_logo.svg')),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
