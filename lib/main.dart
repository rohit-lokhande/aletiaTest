import 'package:flutter/material.dart';
import 'package:test_app/ui/login/login_screen.dart';

import 'constants/routes.dart';
import 'ui/dashboard/dashboard_screen.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.Login,
      routes: {
        Routes.Login: (context) => LoginScreen(),
        Routes.Dashboard: (context) => DashboardScreen(),
      },
    );
  }
}
