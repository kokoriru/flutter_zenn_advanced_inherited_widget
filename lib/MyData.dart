import 'package:riverpod/riverpod.dart';

class MyData extends StateNotifier<double> {
  MyData() : super(0.5);
  void changeState(newState) => this.state = newState;
}
