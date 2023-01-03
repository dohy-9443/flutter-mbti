import 'package:flutter/material.dart';
import 'package:mbti/constants/colors.dart';

class BackgroundBlock extends StatelessWidget {
  const BackgroundBlock({super.key});

  @override
  Widget build(BuildContext context) {
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
}