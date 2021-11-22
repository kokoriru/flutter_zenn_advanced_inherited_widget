import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
      body: MyContents(),
    );
  }
}

class MyContents extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _value = useProvider(_mydataProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${_value.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 100),
        ),
        Slider(
          value: _value,
          onChanged: (value) =>
            context.read(_mydataProvider.notifier).changeState(value)
        )
      ],
    );
  }
}
