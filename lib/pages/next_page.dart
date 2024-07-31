import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keystroke_submit/keyboard_shortcuts.dart';

import '../app_route.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardShortcuts(
      escape: (_) => context.go(AppRoute.formPage),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.go(AppRoute.formPage),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Teste'),
          ),
        ),
      ),
    );
  }
}
