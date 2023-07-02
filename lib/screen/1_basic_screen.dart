import 'package:flutter/material.dart';
import 'package:go_router_project/layout/default_layout.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Center(
        child: Text('Basic Screen'),
      ),
    );
  }
}
