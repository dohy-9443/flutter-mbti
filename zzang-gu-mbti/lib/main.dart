import 'package:flutter/material.dart';
import 'package:zzang_gu_mbti/mock_service/question_mock_service.dart';
import 'package:zzang_gu_mbti/mock_service/result_mock_service.dart';
import 'package:zzang_gu_mbti/presentation/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => QuestionMockService()..loadQuestion(), lazy: false,),
        Provider(create: (_) => ResultMockService()..loadResult(), lazy: false,)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'sunflower'
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
