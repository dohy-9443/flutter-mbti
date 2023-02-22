import 'package:flutter/material.dart';
import 'package:zzang_gu_mbti/common/default_layout.dart';
import 'package:zzang_gu_mbti/components/background_block.dart';

class ResultScreen extends StatelessWidget {
  final String result;
  final int? jp;
  const ResultScreen({super.key, required this.result, this.jp});

  @override
  Widget build(BuildContext context) {
    // final ResultContentsModel mbtiResult = DataUtils.getResult(result: result);

    return DefaultLayout(
      title: const Text('결과 페이지'),
      body: Stack(
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
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'dddd',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 34.0,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                Container(
                  width: 200.0,
                  height: 200.0,
                  // overflow
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  // child: Image.asset(mbtiResult.path, fit: BoxFit.cover),
                  child: Text('dddddddd'),
                ),
                const SizedBox(height: 70.0),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                        'asdfasdf',
                        style: const TextStyle(
                            fontSize: 18.0,
                            height: 1.6,
                            letterSpacing: 0.2
                        )
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
              ],
            ),
          )
        ],
      )
    );
  }



  Future<bool> delayScreen() async {
    bool result = false;
    await Future.delayed(Duration(seconds: 3));

    result = true;

    return result;
  }
}