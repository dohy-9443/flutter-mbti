import 'dart:convert';

import 'package:chopper/src/response.dart';
import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:transition/transition.dart';
import 'package:zzang_gu_mbti/constants/colors.dart';
import 'package:zzang_gu_mbti/domain/models/models.dart';
import 'package:zzang_gu_mbti/mock_service/question_mock_service.dart';
import 'package:zzang_gu_mbti/screen/home_screen.dart';

class TestScreen extends StatefulWidget {
  
  int count = 0;
  int ei = 0;
  int sn = 0;
  int tf = 0;
  int jp = 0;

  TestScreen({super.key});
  

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  QuestionListModel? questionListModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final QuestionModel question = DataUtils.getQuestion(number: widget.count + 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text('짱구 MBTI 테스트'),
        backgroundColor: PRIMARY_COLOR,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                Transition(
                  child: const HomeScreen(),
                  transitionEffect: TransitionEffect.FADE,
                )
              );
            }, 
            icon: const Icon(Icons.home, size: 30.0,)
          )
        ],
      ),
      // drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearPercentIndicator(
              padding: EdgeInsets.zero,
              // percent: (widget.count) / 12,
              percent: 0,
              progressColor: PRIMARY_COLOR,
              lineHeight: 10,
            ),
            const SizedBox(height: 30.0),
            // _question(context: context, question: question),

            FutureBuilder<Response<Result<QuestionListModel>>>(
              future: Provider.of<QuestionMockService>(context).queryQuestion(),
              builder: (context, snapshot) {
                final result = snapshot.data?.body;
                if (result is Error || result == null) {
                  return const Text('Error');
                }
                final value = (result as Success).value;
                if (value == null) return const Text('데이터가 없습니다.');

                final question = value.questionList[widget.count];
                return Text('');
              }
            ),
            const SizedBox(height: 30.0),
            // _answer(
            //   context: context,
            //   answerA: question.answerA,
            //   answerB: question.answerB,
            //   answerAonPressed: () => answerAonPressed(question.type),
            //   answerBonPressed: countUp,
            // )
          ],
        ),
      )
    );
  }

  // void countUp() {
  //   String mbti = '';
  //   if (widget.count < 11) {
  //     setState(() {
  //       widget.count++;
  //     });
  //   }
  //
  //   if (widget.count == 11) {
  //
  //     if (widget.ei > 1) {
  //       mbti = '${mbti}E';
  //     } else {
  //       mbti = '${mbti}I';
  //     }
  //     if (widget.sn > 1) {
  //       mbti = '${mbti}S';
  //     } else {
  //       mbti = '${mbti}N';
  //     }
  //     if (widget.tf > 1) {
  //       mbti = '${mbti}T';
  //     } else {
  //       mbti = '${mbti}F';
  //     }
  //     if (widget.jp > 1) {
  //       mbti = '${mbti}J';
  //     } else {
  //       mbti = '${mbti}P';
  //     }
  //
  //     Navigator.of(context).push(
  //       Transition(
  //         child: ResultScreen(result: mbti, jp: widget.jp),
  //         transitionEffect: TransitionEffect.FADE,
  //       )
  //     );
  //   }
  // }

  // void answerAonPressed(type) {
  //   if (type == QuestionType.EI) {
  //     setState(() {
  //       widget.ei += 1;
  //     });
  //   }
  //   if (type == QuestionType.SN) {
  //     setState(() {
  //       widget.sn += 1;
  //     });
  //   }
  //   if (type == QuestionType.TF) {
  //     setState(() {
  //       widget.tf += 1;
  //     });
  //   }
  //   if (type == QuestionType.JP) {
  //     setState(() {
  //       widget.jp += 1;
  //     });
  //   }
  //   countUp();
  // }

  // Widget _question({
  //   required QuestionModel question, required BuildContext context
  // }) {
  //   return SizedBox(
  //     height: (MediaQuery.of(context).size.height / 2) - 150,
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: const BorderRadius.all(Radius.circular(16.0)),
  //         border: Border.all(
  //           color: primaryColor,
  //           width: 2.0
  //         ),
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.all(10.0),
  //         child: Center(
  //           child: Text(
  //             question.title,
  //             textAlign: TextAlign.center,
  //             style: const TextStyle(
  //               fontSize: 20.0,
  //               fontWeight: FontWeight.w700
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _answer({
  //   required BuildContext context,
  //   required String answerA,
  //   required String answerB,
  //   required VoidCallback answerAonPressed,
  //   required VoidCallback answerBonPressed,
  // }) {
  //   const ts =  TextStyle(fontSize: 16.0);
  //
  //   return SizedBox(
  //     height: (MediaQuery.of(context).size.height / 2) - 150,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: [
  //         SizedBox(
  //           height: 70.0,
  //           child: TransitionButton(
  //             title: answerA,
  //             textStyle: ts,
  //             color: primaryColor,
  //             onPressed: answerAonPressed,
  //           )
  //         ),
  //         const SizedBox(height: 16.0),
  //         SizedBox(
  //           height: 70.0,
  //           child: TransitionButton(
  //             title: answerB,
  //             textStyle: ts.copyWith(color: Colors.black),
  //             color: secondaryColor,
  //             onPressed: answerBonPressed,
  //           )
  //         )
  //       ],
  //     ),
  //   );
  // }
}