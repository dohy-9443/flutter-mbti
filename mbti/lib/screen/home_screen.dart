import 'package:flutter/material.dart';
import 'package:mbti/components/transition_button.dart';
import 'package:mbti/screen/test_screen.dart';
import 'package:transition/transition.dart';

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
    return const Positioned(
      bottom: 50,
      left: 0,
      right: 0,
      child: TransitionButton(
        transitionEffect: TransitionEffect.FADE, 
        title: '테스트 시작하기', 
        screen: TestScreen(), 
        color: Color(0xFFF86B74)
      )
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