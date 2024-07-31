import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keystroke_submit/app_route.dart';
import 'package:keystroke_submit/keyboard_shortcuts.dart';

class FomrPage extends StatefulWidget {
  const FomrPage({super.key});

  @override
  State<FomrPage> createState() => _FomrPageState();
}

class _FomrPageState extends State<FomrPage> {
  @override
  Widget build(BuildContext context) {
    void openModal() {
      showDialog(
        context: context,
        builder: (context) => const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              child: Text('Modal de teste'),
            ),
          ],
        ),
      );
    }

    return KeyboardShortcuts(
      enter: (_) => context.go(AppRoute.nextPage),
      escape: (_) => context.go(AppRoute.choicePage),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.go(AppRoute.choicePage),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(maxWidth: 354),
            child: Focus(
              autofocus: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Email'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Senha'),
                    ),
                  ),
                  const SizedBox(height: 30),
                  FilledButton(
                    onPressed: () => context.go(AppRoute.nextPage),
                    child: const Text('Entrar'),
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.small(
          onPressed: openModal,
        ),
      ),
    );
  }
}
