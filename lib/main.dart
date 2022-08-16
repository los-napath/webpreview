import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        "/": (_) => WebviewScaffold(
              url: "https://www.ltobetheng.com",
              appBar: AppBar(
                title: const Text("Widget webview"),
              ),
              initialChild: Container(
                color: Colors.purpleAccent,
                child: const Center(
                  child: Text('Waiting.....'),
                ),
              ),
            ),
      },
    );
  }
}
