import 'package:flutter/material.dart';

import './views/plan_creator_screen.dart';
import "./plan_provider.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        home: PlanScreenCreator(),
      ),
    );
  }
}
