import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hartman_web_view/constants/app_colors.dart';
import 'package:hartman_web_view/helpers/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            buildTitle("Contact Me"),
            Column(
              children: [
                buildPhoneSection(),
                buildEmailSection(),
              ],
            ),
            buildTextSection(
              "Address",
              """128 Willowbrook Lane
Fairview, CA 90210
United States""",
              fontSize: 15,
            ),
          ],
        ),
      ),
    );
  }

  Column buildEmailSection() {
    return Column(
      children: [
        Row(children: [
          Container(
              padding: EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                "Email",
                style: TextStyle(
                  color: AppColors.hmLightBlue,
                  fontSize: 17.5,
                  fontWeight: FontWeight.w300,
                ),
              )),
          Spacer()
        ]),
        Row(
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
                text: "efeig15@gmail.com",
              ),
            ),
            Spacer()
          ],
        )
      ],
    );
  }

  Column buildPhoneSection() {
    return Column(children: [
      Row(children: [
        Container(
            padding: EdgeInsets.only(top: 20, bottom: 5),
            child: Text(
              "Phone",
              style: TextStyle(
                color: AppColors.hmLightBlue,
                fontSize: 17.5,
                fontWeight: FontWeight.w300,
              ),
            )),
        Spacer()
      ]),
      Row(
        children: [
          RichText(
            text: TextSpan(
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
                text: "+972 587272372",
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    Uri phoneno = Uri.parse('tel: 0587272372');
                    if (await launchUrl(phoneno)) {}
                  }),
          ),
          Spacer()
        ],
      ),
    ]);
  }

  Column buildTextSection(
    String title,
    String text, {
    double fontSize = 15,
    String? link,
    String? linkTitle,
  }) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.hmLightBlue,
                  fontSize: 17.5,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: [
              Flexible(
                child: Text.rich(
                  TextSpan(
                      style: TextStyle(
                        fontSize: fontSize,
                      ),
                      children: [
                        TextSpan(
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: fontSize,
                              fontWeight: FontWeight.w300,
                            ),
                            text: text + (link == null ? "" : " ")),
                        TextSpan(
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              fontSize: fontSize,
                              fontWeight: FontWeight.w300,
                            ),
                            text: linkTitle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                //on tap code here, you can navigate to other page or URL
                                String urlString = link ?? "https://www.google.com";
                                Uri url = Uri.parse(urlString);
                                var urllaunchable = await canLaunchUrl(url);
                                if (urllaunchable) {
                                  await launchUrl(url);
                                } else {
                                  Logger.log("URL can't be launched: $url");
                                }
                              }),
                        TextSpan(
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: fontSize,
                            fontWeight: FontWeight.w300,
                          ),
                          text: "",
                        ),
                      ]),
                ),
              ),
            ],
          ),
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
