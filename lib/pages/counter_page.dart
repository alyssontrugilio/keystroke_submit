import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keystroke_submit/keyboard_shortcuts.dart';

import '../app_route.dart';

class IncrementIntent extends Intent {}

class DecrementIntent extends Intent {}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  CounterPageState createState() => CounterPageState();
}

class CounterPageState extends State<CounterPage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardShortcuts(
      arrowDown: (_) => decrement(),
      arrowUp: (_) => increment(),
      escape: (_) => context.go(AppRoute.choicePage),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.go(AppRoute.choicePage),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$counter',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text('Preesione arrowDown para diminuir'),
                    const SizedBox(height: 10),
                    IconButton(
                      onPressed: decrement,
                      icon: const Icon(Icons.arrow_downward_rounded),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Preesione arrowUp para aumentar'),
                    const SizedBox(height: 10),
                    IconButton(
                      onPressed: increment,
                      icon: const Icon(Icons.arrow_upward_rounded),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
