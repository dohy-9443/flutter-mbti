import 'package:flutter/material.dart';
import 'package:mbti/constants/colors.dart';
import 'package:mbti/constants/result_data.dart';
import 'package:mbti/screen/result_screen.dart';
import 'package:mbti/utils/data_utils.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    
    final list = DataUtils.resultList();
    
    return Drawer(
      backgroundColor: primaryColor,
      child: Column(
        children: [
          const SizedBox(
            height: 200.0,
            child: DrawerHeader(
              child: Text(
                '짱구 MBTI',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700
                ),
              )
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) { 
                return ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return secondaryColor;
                      } else {
                        return primaryColor;
                      }
                    }),
                    foregroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return primaryColor;
                      } else {
                        return Colors.white;
                      }
                    }),
                    shape: MaterialStateProperty.all(null),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  onPressed: () {
                    final List nameList = DataUtils.resultName();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ResultScreen(result: nameList[index]))
                    );
                  }, 
                  child: Text(
                    list[index].name,
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  )
                );
              }
            )
          )
        ],
      ),
    );
  }
}