import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundBlock(),
          Image.asset('asset/img/background.jpeg'),
          _testStartButton()
        ]
      ),
    );
  }

  Widget _testStartButton() {
    return Positioned(
      bottom: 50,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          height: 50.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF86B74),
            ),
            onPressed: () {}, 
            child: const Text(
              '테스트 시작하기',
              style: TextStyle(
                fontSize: 20.0
              ),
            )
          ),
        ),
      ),
    );
  }

  Widget _backgroundBlock() {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: const Color(0xFFF86B74),
          ),
        ),
        Expanded(
          child: Container(
            color: const Color(0xFFFEFF75),
          ),
        )
      ]
    );
  }

  BoxDecoration getGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFF86B74), Color(0xFFFEFF75)]
      )
    );
  }
}