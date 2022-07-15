import 'package:dooadex_constants/dooadex_constants.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Dooadex Package Test App',
      theme: ThemeData(
        primarySwatch: MaterialColor(DdxColor.primaryMaterialColor.colorHex, DdxColor.primaryMaterialColor.swatch),
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
            DdxHttp.init(scheme: "http", host: 'localhost', jsonDecodingOption: JsonDecodingOption.noOption);

            try {
              await DdxHttpClient.get(path: 'members/aedade31@naver.com', port: 3000);
            } catch (e) {
              DdxErrorMessageHandler.showError(context: context, widgetType: WidgetType.dialog);
            }

            // await DdxHttpClient.external(
            //     uriAddress: 'http://localhost:3000/members/aedade31@naver.com', method: DdxHttpConst.method.get);

            // DdxHttp.init(scheme: "https", host: 'api.agify.io');
            // await DdxHttpClient.get(path: '', queryParameters: {"name": "dhkim"});
            // DdxHttp.init(scheme: "https", host: 'api.agify.io', jsonDecodingOption: JsonDecodingOption.noOption);
            // await DdxHttpClient.external(uriAddress: 'https://api.agify.io?name=dhkim', method: "GET");
            // DdxHttp.init(scheme: "https", host: 'api.agify.io', jsonDecodingOption: JsonDecodingOption.utf8);
            // await DdxHttpClient.external(uriAddress: 'https://api.agify.io?name=dhkim', method: "GET");
            //
            // // ///
            // // DdxHttp.init(scheme: "https", host: 'httpbin.org');
            // // await DdxHttpClient.get(path: 'get');
            // // await DdxHttpClient.post(path: 'post', body: {});
            // // await DdxHttpClient.put(path: 'put', body: {});
            // // await DdxHttpClient.delete(path: 'delete', body: {});
            // // await DdxHttpClient.patch(path: 'patch', body: {});

            ///
          },
          child: const Text("Test"),
        ),
      ),
    );
  }
}
