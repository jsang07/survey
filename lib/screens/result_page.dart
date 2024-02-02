import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    resultBox(Color color, String title, String content) {
      return Container(
        width: width * 0.3,
        height: height * 0.4,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: color),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              content,
              style: const TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
      );
    }

    return Container(
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'STEP 3. 목표에 따른 AI 추천',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Text(
                '땡땡땡 님의 일일 필요 칼로리는 약 100Kcal 입니다.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                resultBox(Colors.blue.shade200, '키 height', '99cm'),
                resultBox(Colors.indigo.shade300, '활동 Activity level', '중등도활동'),
                resultBox(Colors.brown.shade100, '목표 purpose', '유저어터'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                height: 170,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'title',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'content',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                'MAIDA AI 제품추천',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: const Center(
                  child: Text(
                    '프로틴',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
