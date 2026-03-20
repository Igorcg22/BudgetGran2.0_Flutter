import 'package:flutter/material.dart';
import 'login.dart';
import 'feed.dart';
import 'perfil.dart';

void main() {
  runApp(BudgetGran());
}

class BudgetGran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BudgetGran',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/feed': (context) => FeedScreen(),
        '/perfil': (context) => PerfilScreen(),
      },
    );
  }
}