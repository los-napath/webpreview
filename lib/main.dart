import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:async';
import 'package:webview_2/screens/welcomeScreen.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:webview_2/tools/webpreview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool firstRun = await IsFirstRun.isFirstRun();
  runApp(MyApp(isFirstRun: firstRun));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Route'),
        ),
        body: const Center(child: Text('My Home Page')));
  }
}

class MyApp extends StatelessWidget {
  // final url = 'https://www.ltobetheng.com';
  final bool? isFirstRun;

  const MyApp({Key? key, this.isFirstRun}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('Is this the first time: $isFirstRun');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      // initialRoute: isFirstRun! ? '/welcome' : '/preview',
      initialRoute: '/welcome',
      routes: {
        '/welcome': (_) => const WelcomeScreen(),
        '/preview': (_) => const WebPreview(),
        // '/preview': (_) => SafeArea(
        //       child: WebviewScaffold(
        //         url: url,
        //         //   title: const Text('Widget webview'),
        //         //   iconTheme: const IconThemeData(color: Colors.white),
        //         //   actions: <Widget>[
        //         //     InkWell(
        //         //       child: const Icon(Icons.refresh),
        //         //       onTap: () {
        //         //         flutterWebviewPlugin.reload();
        //         //         // flutterWebviewPlugin.reloadUrl(); // if you want to reloade another url
        //         //       },
        //         //     ),
        //         //     InkWell(
        //         //       child: const Icon(Icons.stop),
        //         //       onTap: () {
        //         //         flutterWebviewPlugin
        //         //             .stopLoading(); // stop loading the url
        //         //       },
        //         //     ),
        //         //     InkWell(
        //         //       child: const Icon(Icons.remove_red_eye),
        //         //       onTap: () {
        //         //         flutterWebviewPlugin.show(); // appear the webview widget
        //         //       },
        //         //     ),
        //         //     InkWell(
        //         //       child: const Icon(Icons.close),
        //         //       onTap: () {
        //         //         flutterWebviewPlugin.hide(); // hide the webview widget
        //         //       },
        //         //     ),
        //         //     InkWell(
        //         //       child: const Icon(Icons.arrow_back),
        //         //       onTap: () {
        //         //         flutterWebviewPlugin.goBack(); // for going back
        //         //       },
        //         //     ),
        //         //     InkWell(
        //         //       child: const Icon(Icons.forward),
        //         //       onTap: () {
        //         //         flutterWebviewPlugin.goForward(); // for going forward
        //         //       },
        //         //     ),
        //         //   ],
        //         // ),
        //         withZoom: true,
        //         withLocalStorage: true,
        //         initialChild: Container(
        //           color: Colors.white,
        //           child: const Center(
        //             child: Text('Waiting.....'),
        //           ),
        //         ),
        //       ),
        //     ),
      },
      
    );
  }
}

