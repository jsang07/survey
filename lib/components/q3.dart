import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Q3 extends StatefulWidget {
  const Q3({super.key});

  @override
  State<Q3> createState() => _Q3State();
}

class _Q3State extends State<Q3> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool canFlip = false;

  String age = '';

  final textEditController = TextEditingController();

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
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text(
                'Q3.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const Text(
                '연령대를 알려주세요',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      onEditingComplete: () {
                        setState(() {
                          age = textEditController.text;
                        });
                        Future.delayed(const Duration(seconds: 1), () {
                          cardKey.currentState?.toggleCard();
                        });
                      },
                      controller: textEditController,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    )),
                    const Text(
                      '세',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
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
              color: Colors.lightGreen[300],
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
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: age,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w600)),
                      const TextSpan(
                          text: ' 세',
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                    ])),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            textEditController.clear();
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
