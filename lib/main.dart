import 'package:flutter/material.dart';
import 'package:basic_chat/config/theme/app_theme.dart';

import 'package:basic_chat/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App!',

      theme: AppTheme().theme(),

      home: const ChatScreen(),
    );
  }
}