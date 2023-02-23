import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:zzang_gu_mbti/common/constants/colors.dart';
import 'package:zzang_gu_mbti/common/default_layout.dart';
import 'package:zzang_gu_mbti/domain/models/models.dart';
import 'package:zzang_gu_mbti/mock_service/question_mock_service.dart';
import 'package:zzang_gu_mbti/presentation/question/components/question_answer.dart';
import 'package:zzang_gu_mbti/presentation/question/components/question_title.dart';
import 'package:zzang_gu_mbti/presentation/result/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  int count = 0;
  int ei = 0;
  int sn = 0;
  int tf = 0;
  int jp = 0;
  String mbti = '';

  QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  @override
  void initState() {
    super.initState();
    widget.mbti = '';
  }

  @override
  Widget build(BuildContext context) {
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
              future: Provider.of<QuestionMockService>(context).queryQuestion(),
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

  void countUpA(Question question) {
      setState(() {
        if (question.type == 'EI') {
          widget.ei++;
          widget.count++;
          if (widget.count == 3) {
            if (widget.ei >= 2) {
              widget.mbti += 'E';
            } else {
              widget.mbti += 'I';
            }
          }
        }
        if (question.type == 'SN') {
          widget.sn++;
          widget.count++;
          if (widget.count == 6) {
            if (widget.sn >= 2) {
              widget.mbti += 'S';
            } else {
              widget.mbti += 'N';
            }
          }
        }
        if (question.type == 'TF') {
          widget.tf++;
          widget.count++;
          if (widget.count == 9) {
            if (widget.tf >= 2) {
              widget.mbti += 'T';
            } else {
              widget.mbti += 'F';
            }
          }
        }
        if (question.type == 'JP') {
          widget.jp++;
          if (widget.count < 11) {
            widget.count++;
          } else {
            if (widget.jp >= 2) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ResultScreen(result: '${widget.mbti}J'))
              );
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ResultScreen(result: '${widget.mbti}P'))
              );
            }
          }
        }
      });
  }

  void countUpB(Question question) {
      setState(() {
        if (question.type == 'EI') {
          widget.count++;
          if (widget.count < 3) {
          } else {
            if (widget.ei >= 2) {
              widget.mbti += 'E';
            } else {
              widget.mbti += 'I';
            }
          }
        }
        if (question.type == 'SN') {
          widget.count++;
          if (widget.count < 6) {
          } else {
            if (widget.sn >= 2) {
              widget.mbti += 'S';
            } else {
              widget.mbti += 'N';
            }
          }
        }
        if (question.type == 'TF') {
          widget.count++;
          if (widget.count < 9) {
          } else {
            if (widget.tf >= 2) {
              widget.mbti += 'T';
            } else {
              widget.mbti += 'F';
            }
          }
        }
        if (question.type == 'JP') {
          if (widget.count < 11) {
            widget.count++;
          } else {
            if (widget.jp >= 2) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ResultScreen(result: '${widget.mbti}J'))
              );
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ResultScreen(result: '${widget.mbti}P'))
              );
            }
          }
        }
      });
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
            countUpA(question);
          },
          onPressedB: () {
            countUpB(question);
          },
        )
      ],
    );
  }


}
