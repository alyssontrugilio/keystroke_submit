import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:keystroke_submit/app_route.dart';

class ClickEnter extends Intent {}

class FomrPage extends StatefulWidget {
  const FomrPage({super.key});

  @override
  State<FomrPage> createState() => _FomrPageState();
}

class _FomrPageState extends State<FomrPage> {
  @override
  Widget build(BuildContext context) {
    void clickEnter() {
      context.go(AppRoute.nextPage);
    }

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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go(AppRoute.formPage),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.enter): ClickEnter(),
          LogicalKeySet(LogicalKeyboardKey.numpadEnter): ClickEnter(),
        },
        child: Actions(
          actions: <Type, Action<Intent>>{
            ClickEnter: CallbackAction<ClickEnter>(
              onInvoke: (intent) => clickEnter(),
            )
          },
          child: Center(
            child: Container(
              alignment: Alignment.center,
              constraints: const BoxConstraints(maxWidth: 354),
              child: Focus(
                autofocus: true,
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Email'),
                        ),
                        validator: (value) =>
                            value != null ? '' : 'Campo é obrigatório',
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Senha'),
                        ),
                        validator: (value) =>
                            value != null ? '' : 'Campo é obrigatório',
                      ),
                      const SizedBox(height: 30),
                      FilledButton(
                        onPressed: clickEnter,
                        child: const Text('Entrar'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: openModal,
      ),
    );
  }
}
