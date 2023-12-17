import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_luck_wheel/model/registermodel.dart';

class LuckyWheelPage extends StatefulWidget {
  final List<RegistersModel> items;

  LuckyWheelPage({Key? key, required this.items}) : super(key: key);

  @override
  _LuckyWheelPageState createState() => _LuckyWheelPageState();
}

class _LuckyWheelPageState extends State<LuckyWheelPage> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Fortune Wheel'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected.add(
              Fortune.randomInt(0, widget.items.length),
            );
          });
        },
        child: Column(
          children: [
            Expanded(
              child: FortuneWheel(
                selected: selected.stream,
                items: [
                  for (var it in widget.items)
                    FortuneItem(child: Text(it.name)), // Assuming name is a property of RegistersModel
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
