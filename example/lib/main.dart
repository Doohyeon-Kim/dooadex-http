import 'package:flutter/material.dart';
import 'package:gazua_http/gazua_http.dart';
import 'package:twostrings_palette/twostrings_palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Two Strings Package Test App',
      theme: ThemeData(
        primarySwatch:
            MaterialColor(TwoStringsColor.primaryMaterialColor.colorHex, TwoStringsColor.primaryMaterialColor.swatch),
      ),
      home: const MyHomePage(title: 'Two Strings Home Page'),
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
            GzHttp.init(scheme: "https", host: 'api.agify.io');
            await GzHttpClient.get(path: '', queryParameters: {"name": "dhkim"});
            GzHttp.init(scheme: "https", host: 'api.agify.io', jsonDecodingOption: JsonDecodingOption.noOption);
            await GzHttpClient.external(uriAddress: 'https://api.agify.io?name=dhkim', method: "GET");
            GzHttp.init(scheme: "https", host: 'api.agify.io', jsonDecodingOption: JsonDecodingOption.utf8);
            await GzHttpClient.external(uriAddress: 'https://api.agify.io?name=dhkim', method: "GET");

            GzHttp.init(scheme: "https", host: 'httpbin.org');
            await GzHttpClient.get(path: 'get');
            await GzHttpClient.post(path: 'post', body: {});
            await GzHttpClient.put(path: 'put', body: {});
            await GzHttpClient.delete(path: 'delete', body: {});
            await GzHttpClient.patch(path: 'patch', body: {});
          },
          child: const Text("Test"),
        ),
      ),
    );
  }
}
