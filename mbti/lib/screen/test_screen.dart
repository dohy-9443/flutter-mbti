import 'package:flutter/material.dart';
import 'package:mbti/components/transition_button.dart';
import 'package:mbti/constants/colors.dart';
import 'package:mbti/models/qustion_model.dart';
import 'package:mbti/screen/result_screen.dart';
import 'package:mbti/utils/data_utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TestScreen extends StatefulWidget {
  
  int count = -1;
  int ei = 0;
  int sn = 0;
  int tf = 0;
  int jp = 0;

  TestScreen({super.key});
  

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    final QuestionModel question = DataUtils.getQuestion(number: widget.count + 1);

    print('count: ${widget.count}');
    print('ei: ${widget.ei}');
    print('sn: ${widget.sn}');
    print('tf: ${widget.tf}');
    print('jp: ${widget.jp}');
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('짱구 MBTI 테스트'),
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
              percent: (widget.count + 1) / 12,
              progressColor: primaryColor,
              lineHeight: 10,
            ),
            const SizedBox(height: 30.0),
            _question(context: context, question: question),
            const SizedBox(height: 30.0),
            _answer(
              context: context, 
              answerA: question.answerA, 
              answerB: question.answerB,
              answerAonPressed: () => answerAonPressed(question.type),
              answerBonPressed: countUp,
            )
          ],
        ),
      )
    );
  }

  void countUp() {
    String mbti = '';
    if (widget.count < 11) {
      setState(() {
        widget.count++;
      });
    }

    if (widget.count == 11) {

      if (widget.ei > 1) {
        mbti = '${mbti}E';
      } else {
        mbti = '${mbti}I';
      }
      if (widget.sn > 1) {
        mbti = '${mbti}S';
      } else {
        mbti = '${mbti}N';
      }
      if (widget.tf > 1) {
        mbti = '${mbti}T';
      } else {
        mbti = '${mbti}F';
      }
      if (widget.jp > 1) {
        mbti = '${mbti}J';
      } else {
        mbti = '${mbti}P';
      }

      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ResultScreen(result: mbti, jp: widget.jp))
      );
    }
  }

  void answerAonPressed(type) {
    if (type == QuestionType.EI) {
      setState(() {
        widget.ei += 1;
      });
    }
    if (type == QuestionType.SN) {
      setState(() {
        widget.sn += 1;
      });
    }
    if (type == QuestionType.TF) {
      setState(() {
        widget.tf += 1;
      });
    }
    if (type == QuestionType.JP) {
      setState(() {
        widget.jp += 1;
      });
    }
    countUp();
  }

  Widget _question({
    required QuestionModel question, required BuildContext context
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
              question.title,
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

  Widget _answer({ 
    required BuildContext context, 
    required String answerA, 
    required String answerB,
    required VoidCallback answerAonPressed,
    required VoidCallback answerBonPressed,
  }) {
    const ts =  TextStyle(fontSize: 18.0);

    return SizedBox(
      height: (MediaQuery.of(context).size.height / 2) - 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 70.0,
            child: TransitionButton(
              title: answerA, 
              textStyle: ts,
              color: primaryColor, 
              onPressed: answerAonPressed,
            )
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            height: 70.0,
            child: TransitionButton(
              title: answerB, 
              textStyle: ts.copyWith(color: Colors.black),
              color: secondaryColor, 
              onPressed: answerBonPressed, 
            )
          )
        ],
      ),
    );
  }
}