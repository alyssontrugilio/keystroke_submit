import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Enter extends Intent {}

class ArrowUp extends Intent {}

class ArrowDown extends Intent {}

class Escape extends Intent {}

class KeyC extends Intent {}

class KeyF extends Intent {}

class KeyboardShortcuts extends StatelessWidget {
  final Widget child;
  final void Function(Enter)? enter;
  final void Function(ArrowUp)? arrowUp;
  final void Function(ArrowDown)? arrowDown;
  final void Function(Escape)? escape;
  final void Function(KeyC)? keyC;
  final void Function(KeyF)? keyF;

  const KeyboardShortcuts({
    required this.child,
    this.escape,
    this.enter,
    super.key,
    this.arrowUp,
    this.arrowDown,
    this.keyC,
    this.keyF,
  });

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.enter): Enter(),
        LogicalKeySet(LogicalKeyboardKey.numpadEnter): Enter(),
        LogicalKeySet(LogicalKeyboardKey.arrowUp): ArrowUp(),
        LogicalKeySet(LogicalKeyboardKey.arrowDown): ArrowDown(),
        LogicalKeySet(LogicalKeyboardKey.escape): Escape(),
        LogicalKeySet(LogicalKeyboardKey.keyC): KeyC(),
        LogicalKeySet(LogicalKeyboardKey.keyF): KeyF(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          Enter: CallbackAction<Enter>(
            onInvoke: (intent) => enter?.call(intent),
          ),
          ArrowUp: CallbackAction<ArrowUp>(
            onInvoke: (intent) => arrowUp?.call(intent),
          ),
          ArrowDown: CallbackAction<ArrowDown>(
            onInvoke: (intent) => arrowDown?.call(intent),
          ),
          Escape: CallbackAction<Escape>(
            onInvoke: (intent) => escape?.call(intent),
          ),
          KeyC: CallbackAction<KeyC>(
            onInvoke: (intent) => keyC?.call(intent),
          ),
          KeyF: CallbackAction<KeyF>(
            onInvoke: (intent) => keyF?.call(intent),
          )
        },
        child: Focus(
          autofocus: true,
          child: child,
        ),
      ),
    );
  }
}
