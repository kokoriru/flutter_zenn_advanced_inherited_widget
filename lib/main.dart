import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import 'MyData.dart';

// 1. グローバル変数に Provider を設定
final _mydataProvider =
  StateNotifierProvider<MyData, double>((ref) => MyData());

void main() {
  // 2. ProviderScope を設定
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 3. ConsumerWidget を使い、watch を使えるようにする
          Consumer(builder: (context, watch, child) {
            return Text(
              // 4. watch 関数にプロバイダーを渡し、state を取り出す
              "${watch(_mydataProvider).toStringAsFixed(2)}",
              style: TextStyle(fontSize: 100),
            );
          }),
          Consumer(builder: (context, watch, child) {
            return Slider(
              value: watch(_mydataProvider),
              // 5. context.read にプロバイダーの notifier を与えて、メソッドを呼び出す
              onChanged: (value) =>
                context.read(_mydataProvider.notifier).changeState(value)
            );
          }),
        ],
      ),
    );
  }
}
