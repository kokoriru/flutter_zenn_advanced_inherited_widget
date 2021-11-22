import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MyData.dart';

class MySlider extends StatefulWidget {
  @override
  createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      // context.select, read を使ってアクセスする
      value: context.select((MyData mydata) => mydata.value),
      onChanged: (value) => context.read<MyData>().value = value
    );
  }
}
