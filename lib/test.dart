import 'package:flutter/material.dart';
import 'package:hero_app/app/app.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  void upadateAppState() {
    MyApp.instance.appState =  10;
  }
  void getAppState() {
    print(MyApp.instance.appState);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}