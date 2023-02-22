import 'package:flutter/material.dart';
import 'package:zzang_gu_mbti/common/constants/colors.dart';

class QuestionTitle extends StatelessWidget {
  final String title;
  const QuestionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (MediaQuery.of(context).size.height / 2) - 150,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          border: Border.all(
            color: PRIMARY_COLOR,
            width: 2.0
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
        ),
      ),
    );
  }
}
