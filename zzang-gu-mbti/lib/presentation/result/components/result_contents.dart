import 'package:flutter/material.dart';

class ResultContents extends StatelessWidget {
  final String contents;
  const ResultContents({Key? key, required this.contents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Text(
          contents,
          style: const TextStyle(
            fontSize: 18.0,
            height: 1.6,
            letterSpacing: 0.2
          )
        ),
      ),
    );
  }
}
