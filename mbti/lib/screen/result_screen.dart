import 'package:flutter/material.dart';
import 'package:mbti/screen/loading_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<Object>(
      future: delayScreen(),
      builder: (context, snapshot) {
        print('snapshot.data: ${snapshot.data}');

        if (!snapshot.hasData) {
          return const LoadingScreen();
        }

        return Scaffold(
          body: Center(
            child: Text('결과페이지'),
          ),
        );
      }
    );
  }



  Future<bool> delayScreen() async {
    bool result = false;
    await Future.delayed(Duration(seconds: 3));

    result = true;
  
    return result;
  }
}