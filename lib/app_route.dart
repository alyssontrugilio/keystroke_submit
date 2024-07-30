import 'package:go_router/go_router.dart';
import 'package:keystroke_submit/choice_page.dart';
import 'package:keystroke_submit/counter_page.dart';
import 'package:keystroke_submit/form_page.dart';

class AppRoute {
  static const choicePage = '/choice';
  static const counterPage = '/counter';
  static const formPage = '/form';
}

final GoRouter router = GoRouter(
  initialLocation: AppRoute.choicePage,
  routes: [
    GoRoute(
      path: AppRoute.choicePage,
      builder: (context, state) => const ChoicePage(),
    ),
    GoRoute(
      path: AppRoute.counterPage,
      builder: (context, state) => const CounterPage(),
    ),
    GoRoute(
      path: AppRoute.formPage,
      builder: (context, state) => const FomrPage(),
    ),
  ],
);
