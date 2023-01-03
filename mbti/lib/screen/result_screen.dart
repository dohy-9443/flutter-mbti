import 'package:flutter/material.dart';
import 'package:mbti/constants/result_data.dart';
import 'package:mbti/models/result_contents_model.dart';
import 'package:mbti/models/result_model.dart';
import 'package:mbti/screen/loading_screen.dart';
import 'package:mbti/utils/data_utils.dart';

class ResultScreen extends StatelessWidget {
  final String result;
  final int jp;
  const ResultScreen({super.key, required this.result, required this.jp});

  @override
  Widget build(BuildContext context) {
    final ResultContentsModel mbtiResult = DataUtils.getResult(result: result);

    print('name: ${mbtiResult.name}');
    print('contents: ${mbtiResult.contents}');
    print('path: ${mbtiResult.path}');


    return FutureBuilder<Object>(
      future: delayScreen(),
      builder: (context, snapshot) {
        print('snapshot.data: ${snapshot.data}');

        if (!snapshot.hasData) {
          return const LoadingScreen();
        }

        return Scaffold(
          body: Center(
            child: Text('결과페이지 $result 이고 $jp 임'),
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