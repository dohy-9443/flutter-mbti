import 'package:flutter/material.dart';

class TransitionButton extends StatelessWidget {
  final String title;
  final Color color;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  const TransitionButton({super.key, required this.title, required this.color, required this.onPressed, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color
        ),
        onPressed: onPressed, 
        child: Text(
          title,
          style: textStyle,
        )
      )
    );
  }
}
