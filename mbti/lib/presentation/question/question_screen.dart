import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:zzang_gu_mbti/common/default_layout.dart';
import 'package:zzang_gu_mbti/constants/colors.dart';
import 'package:zzang_gu_mbti/domain/models/models.dart';
import 'package:zzang_gu_mbti/mock_service/mock_service.dart';
import 'package:zzang_gu_mbti/presentation/question/components/question_answer.dart';
import 'package:zzang_gu_mbti/presentation/question/components/question_title.dart';

class QuestionScreen extends StatefulWidget {
  int count = 0;
  QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    print('클릭1');
    print('count: ${widget.count}');
    return DefaultLayout(
      title: const Text('짱구 MBTI 테스트'),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearPercentIndicator(
              padding: EdgeInsets.zero,
              percent: widget.count / 12,
              progressColor: PRIMARY_COLOR,
              lineHeight: 10,
            ),
            const SizedBox(height: 30.0),
            FutureBuilder<Response<Result<QuestionListModel>>>(
              future: Provider.of<MockService>(context).queryQuestion(),
              builder: (context, snapshot) {
                final result = snapshot.data?.body;
                if (result is Error || result == null) {
                  return const Text('Error');
                }
                final value = (result as Success).value;
                if (value == null) return const Text('데이터가 없습니다.');

                Question question = value.questionList[widget.count];
                return _body(question: question);
              }
            ),
          ],
        ),
      )
    );
  }

  Widget _body({required Question question}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        QuestionTitle(title: question.title),
        const SizedBox(height: 30.0),
        QuestionAnswer(
          answerA: question.answerA,
          answerB: question.answerB,
          onPressedA: () {
            print('클릭');
            setState(() {
              widget.count++;
            });
          },
          onPressedB: () {
            setState(() {
              widget.count++;
            });
          },
        )
      ],
    );
  }


}
