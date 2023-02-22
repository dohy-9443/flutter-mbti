import 'package:flutter/material.dart';
import 'package:zzang_gu_mbti/common/constants/colors.dart';
import 'package:zzang_gu_mbti/common/transition_button.dart';

class QuestionAnswer extends StatelessWidget {
  final String answerA;
  final String answerB;
  final VoidCallback onPressedA;
  final VoidCallback onPressedB;
  const QuestionAnswer({
    Key? key,
    required this.answerA,
    required this.answerB,
    required this.onPressedA,
    required this.onPressedB
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const ts =  TextStyle(fontSize: 16.0);

    return SizedBox(
      height: (MediaQuery.of(context).size.height / 2) - 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 70.0,
            child: TransitionButton(
              title: answerA,
              textStyle: ts,
              color: PRIMARY_COLOR,
              onPressed: onPressedA,
            )
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            height: 70.0,
            child: TransitionButton(
              title: answerB,
              textStyle: ts.copyWith(color: Colors.black),
              color: SECONDARY_COLOR,
              onPressed: onPressedB,
            )
          )
        ],
      ),
    );
  }
}
