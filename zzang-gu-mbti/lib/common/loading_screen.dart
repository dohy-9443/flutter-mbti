import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zzang_gu_mbti/common/constants/colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Container(
              color: PRIMARY_COLOR,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingAnimationWidget.inkDrop(
                    color: SECONDARY_COLOR, size: 100
                  ),
                  const SizedBox(height: 100.0),
                  const Text(
                    '테스트 결과를 기다리는 중입니다...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                    ),
                  )
                ]
              ),
            )
          );
  }
}