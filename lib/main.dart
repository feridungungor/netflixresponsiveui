import 'package:flutter/material.dart';
import 'package:flutter_responseuiapp/models/repository_provider.dart';
import 'package:provider/provider.dart';
import 'screens/nav_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Repository>(
      create: (_) => Repository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Netflix UI',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: Colors.black
        ),
        // home: HomeScreen(),
        home: NavScreen(),
      ),
    );
  }
}
