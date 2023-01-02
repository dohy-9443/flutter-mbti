import 'package:flutter/material.dart';
import 'package:mbti/components/transition_button.dart';
import 'package:mbti/constants/colors.dart';
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
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: Column(
              children: const [
                Text(
                  '짱구의 못말리는',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0
                  ),
                ),
                Text(
                  'MBTI',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0
                  ),
                )
              ],
            )
          ),
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
        color: primaryColor
      )
    );
  }

  Widget _backgroundBlock() {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: primaryColor,
          ),
        ),
        Expanded(
          child: Container(
            color: secondaryColor,
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
        colors: [primaryColor, secondaryColor]
      )
    );
  }
}