import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:eliachar_feig/constants/app_colors.dart';
import 'package:eliachar_feig/helpers/logger.dart';
import 'package:eliachar_feig/ui_components/top_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  AboutMeState createState() => AboutMeState();
}

class AboutMeState extends State<AboutMe> {
  String appVersion = "null";
  String appBuildNumber = "null";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getVersion(),
      builder: (BuildContext context, AsyncSnapshot<String> appVesion) {
        Widget widget;
        if (appVesion.hasData) {
          widget = Material(
            child: Scaffold(
              appBar: topAppBar(),
              body: Stack(
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildTitle("About Me"),
                        buildTextSection(
                          "My Work",
                          """Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. Leviter flos lavandulae odor aerem implebat, cum risu puerorum prope fontem resonante. Vita hic tardius fluebat, inter consuetudinem et fortuitam laetitiam balanciam inveniens. Stellae paulatim in nocte fulgere coeperunt, et Emilia tranquillitatem sensit—memento quod saepe in simplicissimis momentis maxima pulchritudo latet.""",
                        ),
                        buildTextSection("My Status",
                            """Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. Leviter flos lavandulae odor aerem implebat, cum risu puerorum prope fontem resonante. Vita hic tardius fluebat, inter consuetudinem et fortuitam laetitiam balanciam inveniens. Stellae paulatim in nocte fulgere coeperunt, et Emilia tranquillitatem sensit—memento quod saepe in simplicissimis momentis maxima pulchritudo latet."""),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "My work focuses on",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17.5,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("• "),
                                      Expanded(
                                        child: Text(
                                            "Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. Leviter flos lavandulae odor aerem implebat, cum risu puerorum prope fontem resonante. Vita hic tardius fluebat, inter consuetudinem et fortuitam laetitiam balanciam inveniens. Stellae paulatim in nocte fulgere coeperunt, et Emilia tranquillitatem sensit—memento quod saepe in simplicissimis momentis maxima pulchritudo latet.",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("• "),
                                      Expanded(
                                        child: Text(
                                            "Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. Leviter flos lavandulae odor aerem implebat, cum risu puerorum prope fontem resonante. Vita hic tardius fluebat, inter consuetudinem et fortuitam laetitiam balanciam inveniens. Stellae paulatim in nocte fulgere coeperunt, et Emilia tranquillitatem sensit—memento quod saepe in simplicissimis momentis maxima pulchritudo latet.",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("• "),
                                      Expanded(
                                        child: Text(
                                            "Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. Leviter flos lavandulae odor aerem implebat, cum risu puerorum prope fontem resonante. Vita hic tardius fluebat, inter consuetudinem et fortuitam laetitiam balanciam inveniens. Stellae paulatim in nocte fulgere coeperunt, et Emilia tranquillitatem sensit—memento quod saepe in simplicissimis momentis maxima pulchritudo latet.",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("• "),
                                      Expanded(
                                        child: Text(
                                            "Aurora ruborem caeli tingebat, dum ventus leniter folia quercuum veterum susurrabat, quasi fabulas antiquitatis narrans. Per vicum lapideum, Emilia lenta vestigia ferebat, cogitationes eius sicut nubes errantes. Leviter flos lavandulae odor aerem implebat, cum risu puerorum prope fontem resonante. Vita hic tardius fluebat, inter consuetudinem et fortuitam laetitiam balanciam inveniens. Stellae paulatim in nocte fulgere coeperunt, et Emilia tranquillitatem sensit—memento quod saepe in simplicissimis momentis maxima pulchritudo latet.",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                            )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Show environment switching w/ password popup if supposed to...
                ],
              ),
            ),
          );
        } else {
          widget = Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return widget;
      },
    );
  }

  Column buildTextSection(
    String title,
    String text, {
    String? link,
    String? linkTitle,
    double fontSize = 15,
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
                  color: Colors.grey,
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
                            //make link blue and underline
                            text: linkTitle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                //on tap code here, you can navigate to other page or URL
                                String urlString = link ?? "https://www.google.com";
                                Uri url = Uri.parse(urlString);
                                var urllaunchable = await canLaunchUrl(url); //canLaunchUrl is from url_launcher package
                                if (urllaunchable) {
                                  await launchUrl(url); //launchUrl is from url_launcher package to launch URL
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
      child: Column(
        children: [
          Row(
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
          Row(
            children: [
              Expanded(
                child: Text(
                  'App version: $appVersion ($appBuildNumber)',
                  style: TextStyle(fontSize: 12.5, color: AppColors.hmDarkBlue),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    appBuildNumber = packageInfo.buildNumber;
    return appVersion;
  }
}
