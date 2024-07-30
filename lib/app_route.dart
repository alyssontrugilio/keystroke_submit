import 'package:go_router/go_router.dart';

import 'pages/pages.dart';

class AppRoute {
  static const choicePage = '/choice_page';
  static const counterPage = '/counter_page';
  static const formPage = '/form_page';
  static const nextPage = '/next_page';
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
    GoRoute(
      path: AppRoute.nextPage,
      builder: (context, state) => const NextPage(),
    ),
  ],
);
