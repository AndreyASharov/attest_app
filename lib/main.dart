import 'package:attest_app/users_list_screen.dart';
import 'package:flutter/material.dart';
import 'auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(),
      ),
      routes: {
        '/': (context) => const Auth(),
        '/UsersListScreen': (context) => const UsersListScreen(),
      },
    );
  }
}
