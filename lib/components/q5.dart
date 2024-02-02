import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Q5 extends StatefulWidget {
  const Q5({super.key});

  @override
  State<Q5> createState() => _Q5State();
}

class _Q5State extends State<Q5> {
  List<bool> select = [false, false, false, false];
  Color basicColor = Color.fromARGB(255, 250, 230, 213);

  void selected(int firstNum, int secondNum, int thirdNum, int myNum) {
    if (select[firstNum] == false &&
        select[secondNum] == false &&
        select[thirdNum] == false) {
      setState(() {
        select[myNum] = true;
      });
    }
  }

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool canFlip = false;

  String activity = '';
  String exAct = '';

  void checkCanFlip() {
    if (select[0] == true ||
        select[1] == true ||
        select[2] == true ||
        select[3] == true) {
      if (select[0] == true) {
        setState(() {
          activity = '가벼운 활동';
          exAct = '(사무직)';
        });
      } else if (select[1] == true) {
        setState(() {
          activity = '중등도 활동';
          exAct = '(서서하는 업무)';
        });
      } else if (select[2] == true) {
        setState(() {
          activity = '강한 활동';
          exAct = '(농업, 어업, 건설업 등)';
        });
      } else if (select[3] == true) {
        setState(() {
          activity = '아주 강한 활동';
          exAct = '(운동선수 등)';
        });
      }

      Future.delayed(const Duration(seconds: 1), () {
        cardKey.currentState?.toggleCard();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return FlipCard(
      key: cardKey,
      flipOnTouch: false,
      fill: Fill.fillBack,
      direction: FlipDirection.VERTICAL,
      side: CardSide.FRONT,
      front: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 50.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(13)),
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Text(
                'Q5.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const Text(
                '일일 활동량을 알려주세요',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              // 1
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 14.0),
                child: GestureDetector(
                    onTap: () {
                      selected(1, 2, 3, 0);
                      checkCanFlip();
                    },
                    child: Container(
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: select[0] == true ? Colors.black : basicColor),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            '가벼운 활동  ',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: select[0] == true
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          Text(
                            '(ex.사무직)',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: select[0] == true
                                    ? Colors.white
                                    : Colors.grey.shade600),
                          ),
                        ],
                      ),
                    )),
              ),
              // 2
              Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: GestureDetector(
                    onTap: () {
                      selected(0, 2, 3, 1);
                      checkCanFlip();
                    },
                    child: Container(
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: select[1] == true ? Colors.black : basicColor),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            '중등도 활동  ',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: select[1] == true
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          Text(
                            '(ex.서서하는 업무)',
                            style: TextStyle(
                                color: select[1] == true
                                    ? Colors.white
                                    : Colors.grey.shade600,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )),
              ),
              // 3
              Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: GestureDetector(
                    onTap: () {
                      selected(0, 1, 3, 2);
                      checkCanFlip();
                    },
                    child: Container(
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: select[2] == true ? Colors.black : basicColor),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            '강한 활동  ',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: select[2] == true
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          Text(
                            '(ex.농업, 어업, 건설업 등)',
                            style: TextStyle(
                                color: select[2] == true
                                    ? Colors.white
                                    : Colors.grey.shade600,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )),
              ),
              // 4
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: GestureDetector(
                    onTap: () {
                      selected(0, 1, 2, 3);
                      checkCanFlip();
                    },
                    child: Container(
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: select[3] == true ? Colors.black : basicColor),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            '아주 강한 활동  ',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: select[3] == true
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          Text(
                            '(ex.운동선수 등)',
                            style: TextStyle(
                                color: select[3] == true
                                    ? Colors.white
                                    : Colors.grey.shade600,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      back: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      activity,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      exAct,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            select[0] = false;
                            select[1] = false;
                            select[2] = false;
                            select[3] = false;
                          });
                          cardKey.currentState?.toggleCard();
                        },
                        child: const Icon(
                          Icons.restore_page,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
