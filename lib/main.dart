import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
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
      initialRoute: isFirstRun! ? '/welcome' : '/preview',
      // initialRoute: '/welcome',
      routes: {
        '/welcome': (_) => const WelcomeScreen(),
        '/preview': (_) => const WebPreview(),
      },
      
    );
  }
}

