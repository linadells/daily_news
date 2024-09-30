import 'package:clean_archit/config/theme/app_theme.dart';
import 'package:clean_archit/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:clean_archit/injection_container.dart';
import 'package:flutter/material.dart';

void main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: DailyNews(),
    );
  }
}
