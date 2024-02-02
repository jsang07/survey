import 'package:flutter/material.dart';
import 'package:flutterweb/components/q1.dart';
import 'package:flutterweb/components/q2.dart';
import 'package:flutterweb/components/q3.dart';
import 'package:flutterweb/components/q4.dart';
import 'package:flutterweb/components/q5.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    //final width = MediaQuery.of(context).size.width;
    //final height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: const Color.fromARGB(255, 198, 233, 235),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'STEP 1. 기초 정보',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Text(
                '고객님의 기초 정보를 알려주세요.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Q1(),
            Q2(),
            Q3(),
            Q4(),
            Q5()
          ],
        ),
      ),
    );
  }
}
