import 'package:flutter/material.dart';

class ResultTitle extends StatelessWidget {
  final String name;
  final String path;
  const ResultTitle ({Key? key, required this.name, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            name,
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
          child: Image.asset(path, fit: BoxFit.cover),
        ),
      ],
    );
  }
}
