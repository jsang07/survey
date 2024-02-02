import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 14, bottom: 20),
            child: Text(
              'MAIDA 보충제 AI 제품 추천',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              stepBox('step1', '기초 정보 분석'),
              const VerticalDivider(
                width: 30,
                color: Colors.black,
                thickness: 10,
              ),
              stepBox('step2', '라이프스타일 분석'),
              const VerticalDivider(
                width: 30,
                color: Colors.black,
                thickness: 10,
              ),
              stepBox('step3', '목표에 따른 AI 추천')
            ],
          ),
          Image.asset('assets/main.png'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('시작하기',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Icon(Icons.arrow_circle_down),
          ),
        ],
      ),
    );
  }

  stepBox(String step, String stepTitle) {
    return Container(
      child: Column(
        children: [
          Text(step,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
          Text(stepTitle)
        ],
      ),
    );
  }
}
