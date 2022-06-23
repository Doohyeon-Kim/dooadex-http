import 'dart:io';

import 'package:dooadex_error_handler/dooadex_error_handler.dart';
import 'package:dooadex_palette/dooadex_palette.dart';
import 'package:flutter/material.dart';
import 'package:dooadex_http/dooadex_http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dooadex Package Test App',
      theme: ThemeData(
        primarySwatch: MaterialColor(DooadexColor.primaryMaterialColor.colorHex,
            DooadexColor.primaryMaterialColor.swatch),
      ),
      home: const MyHomePage(title: 'Dooadex Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            DooadexHttp.init(scheme: "https", host: 'api.agify.io');
            await DooadexHttpClient.get(
                path: '', queryParameters: {"name": "dhkim"});
            DooadexHttp.init(scheme: "https", host: 'httpbin.org');
            await DooadexHttpClient.get(path: 'get');
            await DooadexHttpClient.post(path: 'post', body: {});
            await DooadexHttpClient.put(path: 'put', body: {});
            await DooadexHttpClient.delete(path: 'delete', body: {});
            await DooadexHttpClient.patch(path: 'patch', body: {});
            await DooadexHttpClient.external(
                uriAddress: 'https://api.agify.io?name=dhkim', method: "GET");
          },
          child: const Text("Test"),
        ),
      ),
    );
  }
}
