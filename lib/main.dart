import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MyInheritedWidget.dart';
import 'Widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    print("count:" + _counter.toString());
  }

  // Scaffold の下の Center 部分を先に静的に作っておき、作り返さないように制御
  // 深い階層の伝播は証明できたためにシンプルに Center->WidgetA に変更
  final Widget _widget = Center(child: WidgetA());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // 静的に作ったCenterより下のツリーを配置する
      body: Provider<int>.value(value: _counter, child: _widget),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
