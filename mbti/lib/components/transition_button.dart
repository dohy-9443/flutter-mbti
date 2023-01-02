import 'package:flutter/material.dart';
import 'package:transition/transition.dart';

class TransitionButton extends StatelessWidget {
  final TransitionEffect transitionEffect;
  final String title;
  final Widget screen;
  final Color color;
  const TransitionButton({super.key, required this.transitionEffect, required this.title, required this.screen, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color
          ),
          onPressed: () {
            Navigator.of(context).push(
              Transition(
                child: screen,
                transitionEffect: transitionEffect
              )
            );
          }, 
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20.0
            ),
          )
        )
      ),
    );
  }
}




