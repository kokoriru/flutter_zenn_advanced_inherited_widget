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
    final mydata = Provider.of<MyData>(context);
    return Slider(value: mydata.value, onChanged: (value) => mydata.value = value);
  }
}
