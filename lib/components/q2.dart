import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Q2 extends StatefulWidget {
  const Q2({super.key});

  @override
  State<Q2> createState() => _Q2State();
}

class _Q2State extends State<Q2> {
  List<bool> select = [false, false];
  Color basicColor = const Color.fromARGB(255, 250, 230, 213);

  void selected(int idx, int myNum) {
    if (select[idx] == false) {
      setState(() {
        select[myNum] = true;
      });
    }
  }

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool canFlip = false;

  String sex = '';

  void checkCanFlip() {
    if (select[0] == true || select[1] == true) {
      if (select[0] == true) {
        setState(() {
          sex = '여';
        });
      } else {
        setState(() {
          sex = '남';
        });
      }

      Future.delayed(const Duration(seconds: 1), () {
        cardKey.currentState?.toggleCard();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      key: cardKey,
      flipOnTouch: false,
      fill: Fill.fillBack,
      direction: FlipDirection.VERTICAL,
      side: CardSide.FRONT,
      front: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(13)),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Q2.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const Text(
                '성별을 알려주세요',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      selected(1, 0);
                      checkCanFlip();
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor:
                          select[0] == true ? Colors.black : basicColor,
                      child: Text(
                        '여',
                        style: TextStyle(
                            fontSize: 19,
                            color: select[0] == true
                                ? Colors.white
                                : Colors.grey.shade600),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      selected(0, 1);
                      checkCanFlip();
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor:
                          select[1] == true ? Colors.black : basicColor,
                      child: Text(
                        '남',
                        style: TextStyle(
                            fontSize: 19,
                            color: select[1] == true
                                ? Colors.white
                                : Colors.grey.shade600),
                      ),
                    ),
                  ),
                ],
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
              color: Colors.deepOrange[300],
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      sex,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            select[0] = false;
                            select[1] = false;
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
