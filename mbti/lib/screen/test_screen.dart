import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('짱구 MBTI TEST')
      ),
      body: Center(
        child: Text('테스트'),
      ),
    );
  }
}