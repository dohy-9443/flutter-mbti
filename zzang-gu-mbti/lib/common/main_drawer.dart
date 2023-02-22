import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zzang_gu_mbti/common/constants/colors.dart';
import 'package:zzang_gu_mbti/domain/models/models.dart';
import 'package:zzang_gu_mbti/mock_service/result_mock_service.dart';
import 'package:zzang_gu_mbti/presentation/result/result_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    
    // final list = DataUtils.resultList();
    
    return Drawer(
      backgroundColor: PRIMARY_COLOR,
      child: Column(
        children: [
          const SizedBox(
            height: 150.0,
            child: DrawerHeader(
              child: Text(
                '짱구의 못말리는\nMBTI',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700
                ),
              )
            ),
          ),
          FutureBuilder<Response<Result<List<ResultDetail>>>>(
            future: Provider.of<ResultMockService>(context).resultTypeList(),
            builder: (context, snapshot) {
              final result = snapshot.data?.body;
              if (result is Error || result == null) {
                return const Text('Error');
              }
              final List<ResultDetail> value = (result as Success).value;
              if (value.isEmpty) return const Text('데이터가 없습니다.');

              return Expanded(
                child: ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (BuildContext context, int index) {
                    String name = value[index].detail.name;
                    String type = value[index].type;
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return SECONDARY_COLOR;
                          } else {
                            return PRIMARY_COLOR;
                          }
                        }),
                        foregroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return PRIMARY_COLOR;
                          } else {
                            return Colors.white;
                          }
                        }),
                        shape: MaterialStateProperty.all(null),
                        elevation: MaterialStateProperty.all(0),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => ResultScreen(result: type))
                        );
                      },
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      )
                    );
                  }
                )
              );
            }
          )
        ],
      ),
    );
  }
}