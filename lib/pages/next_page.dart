import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_route.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go(AppRoute.choicePage),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: const Center(
        child: Text('Segunda pagina'),
      ),
    );
  }
}
