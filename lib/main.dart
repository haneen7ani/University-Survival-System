import 'package:flutter/material.dart';

import 'screens/setup_screen.dart';
import 'theme/app_theme.dart';

void main() => runApp(const UniversitySurvivalApp());

class UniversitySurvivalApp extends StatelessWidget {
  const UniversitySurvivalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'University Survival System',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const SetupScreen(),
    );
  }
}
