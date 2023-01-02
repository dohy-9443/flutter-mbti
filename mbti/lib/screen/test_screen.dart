import 'package:flutter/material.dart';
import 'package:mbti/constants/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String question = '곧 크리스마스!\n회사에서 크리스마스 파티 스텝을 모집한다는데?';
    const String answer1 = '파티 스텝은 못하지ㅎ...\n(그래도 파티는 재밌겠다 히히)';
    const String answer2 = '재밌겠다!\n○○한테 같이 지원하자고 해야지~';
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('짱구 MBtI 테스트'),
      ),
      drawer:Drawer(
        backgroundColor: primaryColor,
        child: ListView(
          children: [
            DrawerHeader(child: Text('테스트'))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearPercentIndicator(
              padding: EdgeInsets.zero,
              percent: 0.084,
              progressColor: primaryColor,
              lineHeight: 10,
            ),
            const SizedBox(height: 30.0),
            _question(context: context, question: question),
            const SizedBox(height: 30.0),
            _answer(context: context, answerA: answer1, answerB: answer2)
          ],
        ),
      )
    );
  }

  Widget _question({
    required String question, required BuildContext context
  }) {
    return SizedBox(
      height: (MediaQuery.of(context).size.height / 2) - 150,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          border: Border.all(
            color: primaryColor,
            width: 2.0
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              question,
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

  Widget _answer({ required BuildContext context, required String answerA, required String answerB }) {
    return SizedBox(
      height: (MediaQuery.of(context).size.height / 2) - 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 70.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor
              ),
              onPressed: () {}, 
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  answerA,
                  style: const TextStyle(
                    fontSize: 18.0
                  ),
                ),
              )
            )
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            height: 70.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: secondaryColor
              ),
              onPressed: () {}, 
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  answerB, 
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0
                  ),
                ),
              )
            )
          ),
        ],
      ),
    );
  }
}