import 'package:flutter/material.dart';
import 'package:transition/transition.dart';
import 'package:zzang_gu_mbti/common/constants/colors.dart';
import 'package:zzang_gu_mbti/common/main_drawer.dart';
import 'package:zzang_gu_mbti/screen/home_screen.dart';

class DefaultLayout extends StatelessWidget {
  final Widget title;
  final Widget body;
  const DefaultLayout({Key? key, required this.title, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: title,
      ),
      drawer: const MainDrawer(),
      body: body,
    );
  }
}
