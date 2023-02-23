import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zzang_gu_mbti/common/default_layout.dart';
import 'package:zzang_gu_mbti/common/background_block.dart';
import 'package:zzang_gu_mbti/common/loading_screen.dart';
import 'package:zzang_gu_mbti/domain/models/models.dart';
import 'package:zzang_gu_mbti/mock_service/result_mock_service.dart';
import 'package:zzang_gu_mbti/presentation/result/components/result_contents.dart';

import 'components/result_title.dart';

class ResultScreen extends StatelessWidget {
  final String result;
  const ResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    print('result: $result');
    return DefaultLayout(
      title: Text(result),
      body:
      FutureBuilder<Response<Result<ResultDetail>>>(
        future: Provider.of<ResultMockService>(context).queryResult(mbti: result),
        builder: (context, snapshot) {

          if (snapshot.connectionState != ConnectionState.done) {
            return const LoadingScreen();
          }
          final result = snapshot.data?.body;
          if (result is Error || result == null) {
            return const Text('Error');
          }
          final value = (result as Success).value;
          if (value == null) return const Text('데이터가 없습니다.');
          String type = value.type;
          ResultContent detail = value.detail;
          return _body(detail);
        },
      )
    );
  }

  Widget _body(ResultContent detail) {
    return Stack(
      children: [
        const BackgroundBlock(),
        Padding(
          padding: const EdgeInsets.only(
            top: kTextTabBarHeight,
            left: 20.0,
            right: 20.0
          ),
          child: Column(
            children: [
              ResultTitle(name: detail.name, path: detail.path),
              const SizedBox(height: 70.0),
              ResultContents(contents: detail.contents),
              const SizedBox(height: 32.0),
            ],
          ),
        )
      ],
    );
  }

  Future<bool> delayScreen() async {
    bool result = false;
    await Future.delayed(Duration(seconds: 3));

    result = true;

    return result;
  }
}



