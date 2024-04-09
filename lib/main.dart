import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/controllers/user_controller.dart';
import 'screens/controllers/study_controller.dart';
import 'screens/register_screen.dart';
import 'screens/login_screen.dart';
import 'screens/study_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserController()),
        ChangeNotifierProvider(create: (_) => StudyController()),
      ],
      child: MaterialApp(
        title: 'Study App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/register',
        routes: {
          '/register': (context) => RegisterScreen(),
          '/login': (context) => LoginScreen(),
          '/study': (context) => const StudyScreen(),
        },
      ),
    );
  }
}