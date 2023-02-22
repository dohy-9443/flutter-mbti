import 'package:flutter/material.dart';
import 'package:zzang_gu_mbti/common/constants/colors.dart';

class BackgroundBlock extends StatelessWidget {
  const BackgroundBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: PRIMARY_COLOR,
          ),
        ),
        Expanded(
          child: Container(
            color: SECONDARY_COLOR,
          ),
        )
      ]
    );
  }
}