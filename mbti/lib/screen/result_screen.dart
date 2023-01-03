import 'package:flutter/material.dart';
import 'package:mbti/components/background_block.dart';
import 'package:mbti/constants/colors.dart';
import 'package:mbti/models/result_contents_model.dart';
import 'package:mbti/screen/home_screen.dart';
import 'package:mbti/screen/loading_screen.dart';
import 'package:mbti/utils/data_utils.dart';
import 'package:transition/transition.dart';

class ResultScreen extends StatelessWidget {
  final String result;
  final int jp;
  const ResultScreen({super.key, required this.result, required this.jp});

  @override
  Widget build(BuildContext context) {
    final ResultContentsModel mbtiResult = DataUtils.getResult(result: result);

    return FutureBuilder<Object>(
      future: delayScreen(),
      builder: (context, snapshot) {

        if (!snapshot.hasData) {
          return const LoadingScreen();
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
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
            title: Text(mbtiResult.name),
          ),
          drawer:Drawer(
            backgroundColor: primaryColor,
            child: ListView(
              children: [
                DrawerHeader(child: Text('테스트'))
              ],
            ),
          ),
          body: Stack(
            children: [
              const BackgroundBlock(),
              Padding(
                padding: const EdgeInsets.only(
                  top: kTextTabBarHeight,
                  left: 16.0,
                  right: 16.0
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        mbtiResult.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    Container(
                      width: 200.0,
                      height: 200.0,
                      // overflow
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(mbtiResult.path, fit: BoxFit.cover),
                    ),
                    const SizedBox(height: 70.0),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(mbtiResult.contents, style: const TextStyle(fontSize: 18.0)),
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
    );
  }



  Future<bool> delayScreen() async {
    bool result = false;
    await Future.delayed(Duration(seconds: 3));

    result = true;
  
    return result;
  }
}