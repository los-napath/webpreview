import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebPreview extends StatefulWidget {
  const WebPreview({super.key});

  @override
  State<WebPreview> createState() => _WebPreviewState();
}

class _WebPreviewState extends State<WebPreview> {
  // String url = 'https://www.ltobetheng.com';
  // String url = 'https://www.ltobet.com/register/agentltoheng';

  String url = 'https://www.thairath.co.th/lottery';

  final flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      if (state.type == WebViewState.finishLoad) {
        // if the full website page loaded
        print("loaded...");
      } else if (state.type == WebViewState.abortLoad) {
        // if there is a problem with loading the url
        print("Invalid URL....");
        print("there is a problem...");
      } else if (state.type == WebViewState.startLoad) {
        // if the url started loading
        print("start loading...");
      }
      print("current state ----------------------> $state");
    });

    flutterWebviewPlugin.onUrlChanged.listen((String currentUrl) {
      print("current url ----------------------> $currentUrl");
    });

    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) => flutterWebviewPlugin.show());
  }

  @override
  Widget build(BuildContext context) {
    final heightBotNavBar = MediaQuery.of(context).size.height * 0.06;

    return SafeArea(
      child: WebviewScaffold(
        url: url,
        withZoom: true,
        withLocalStorage: true,
        hidden: false,


        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 5,
              child: GestureDetector(
                onTap: () => {flutterWebviewPlugin.goBack()},
                child: Container(
                 
                  // padding: const EdgeInsets.only(left: 5.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 119, 237),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: heightBotNavBar,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          Icons.arrow_back_ios,
                          size: 15.0,
                        ),
                        Text(' Back')
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: GestureDetector(
                onTap: () => {flutterWebviewPlugin.goForward()},
                child: Container(
                  // padding: const EdgeInsets.only(left: 5.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 119, 237),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: heightBotNavBar,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text('Next '),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                  onTap: () => {
                        // flutterWebviewPlugin.reloadUrl(
                        //     'https://www.ltobet.com/register/agentltoheng')
                        flutterWebviewPlugin.reload()
                      },
                  child: Container(
                    height: heightBotNavBar,
                    //margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.001),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(heightBotNavBar * 0.01),
                      child: Image.asset('assets/logo500.png', fit: BoxFit.cover),
                    ),
                  )),
            ),
          ],
        ),

      ),
    );
  }
}
