import 'package:app_dipendente_merendels/views/dashboard.dart';
import 'package:app_dipendente_merendels/views/requests.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const AppDipendente());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Dashboard(),
      routes: [
        GoRoute(path: '/requets', builder: (context, state) => Requests()),
      ],
    ),
    GoRoute(path: '/login', builder: (context, state) => Dashboard()),
  ],
);

class AppDipendente extends StatelessWidget {
  const AppDipendente({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}
