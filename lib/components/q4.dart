import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Q4 extends StatefulWidget {
  const Q4({super.key});

  @override
  State<Q4> createState() => _Q4State();
}

class _Q4State extends State<Q4> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool canFlip = false;

  String height = '';

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
                'Q4.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const Text(
                '키(cm) 를 알려주세요',
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
                          height = textEditController.text;
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
                      'cm',
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
              color: Colors.lightBlue, borderRadius: BorderRadius.circular(15)),
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
                          text: height,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w600)),
                      const TextSpan(
                          text: ' cm',
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
