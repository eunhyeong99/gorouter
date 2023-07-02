import 'package:flutter/material.dart';
import 'package:go_router_project/route/router.dart';
import 'package:go_router_project/screen/root_screen.dart';

void main() {
  runApp(
    _App(),
  );
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
