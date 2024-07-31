import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keystroke_submit/app_route.dart';
import 'package:keystroke_submit/keyboard_shortcuts.dart';

class ChoicePage extends StatelessWidget {
  const ChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardShortcuts(
      keyC: (_) => context.go(AppRoute.counterPage),
      keyF: (_) => context.go(AppRoute.formPage),
      child: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pressione C para acessar contador'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => context.go(AppRoute.counterPage),
                    child: const Text('COUNTER'),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pressione F para acessar formulário'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => context.go(AppRoute.formPage),
                    child: const Text('FORMULÁRIO'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
