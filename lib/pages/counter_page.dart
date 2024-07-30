import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go(AppRoute.choicePage),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.arrowUp): IncrementIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowDown): DecrementIntent(),
        },
        child: Actions(
          actions: <Type, Action<Intent>>{
            IncrementIntent: CallbackAction<IncrementIntent>(
              onInvoke: (IncrementIntent intent) => increment(),
            ),
            DecrementIntent: CallbackAction<DecrementIntent>(
              onInvoke: (DecrementIntent intent) => decrement(),
            ),
          },
          child: Focus(
            autofocus: true,
            child: Column(
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
                    IconButton(
                      onPressed: decrement,
                      icon: const Icon(Icons.arrow_downward_rounded),
                    ),
                    IconButton(
                      onPressed: increment,
                      icon: const Icon(Icons.arrow_upward_rounded),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
