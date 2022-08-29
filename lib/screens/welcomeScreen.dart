import 'package:flutter/material.dart';
import 'items.dart';
import 'package:url_launcher/url_launcher.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double? currentPage = 0.0;
  final _pageViewController = PageController();

  List<Widget> slides = items
      .map((item) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: <Widget>[
              // Image
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Image.asset(
                  item['image'],
                  fit: BoxFit.fitWidth,
                  width: 220.0,
                  alignment: Alignment.bottomCenter,
                ),
              ),

              // Body Content
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: <Widget>[
                      Text(item['header'],
                          style: const TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w300,
                              color: Color(0XFF3F3D56),
                              height: 2.0)),
                      Text(
                        item['description'],
                        style: const TextStyle(
                            color: Colors.grey,
                            letterSpacing: 1.2,
                            fontSize: 16.0,
                            height: 1.3),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              )
            ],
          )))
      .toList();

  List<Widget> indicator() => List<Widget>.generate(
      slides.length,
      (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                color: currentPage!.round() == index
                    ? Color(0XFF256075)
                    : Color(0XFF256075).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0)),
          ));

  @override
  Widget build(BuildContext context) {
    // const appStoreUrl = 'https://apps.apple.com/us/app/heng-lotto/id1642309118';
    // final Uri appStoreUrl = Uri.parse('https://apps.apple.com/us/app/heng-lotto/id1642309118');
    final Uri appStoreUrl = Uri.parse('https://play.google.com/store/apps/details?id=com.spotify.tv.android&hl=en&gl=US');
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageViewController,
            itemCount: slides.length,
            itemBuilder: (BuildContext context, int index) {
              _pageViewController.addListener(() {
                setState(() {
                  currentPage = _pageViewController.page;
                });
              });
              return slides[index];
            },
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 70.0),
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: currentPage!.round() < 2
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: indicator(),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: ElevatedButton(
                                  onPressed: () => 
                                      {
                                        launchUrl(appStoreUrl)
                                      },
                                  child: const Text(
                                    'ให้ดาว',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: ElevatedButton(
                                  onPressed: () => {
                                        Navigator.pushNamed(context, '/preview')
                                      },
                                  child: const Text(
                                    'พร้อมแล้ว',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                        ],
                      ),
              ))
        ],
      ),
    );
  }
}
