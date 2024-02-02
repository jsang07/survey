import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
// import 'package:async/async.dart';

class Q1 extends StatefulWidget {
  const Q1({super.key});

  @override
  State<Q1> createState() => _Q1State();
}

class _Q1State extends State<Q1> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool canFlip = false;

  final textEditController = TextEditingController();
  String name = '';
  // final AsyncMemoizer<String> _memoizer = AsyncMemoizer();
  // final Duration _debounceDuration = Duration(seconds: 2);
  // String _searchText = '';
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
                'Q1.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const Text(
                '어떻게 불러드릴까요?',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const Text(
                '(성함/닉네임 모두 좋아요!)',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  // onChanged: (value) {
                  //   _memoizer.runOnce(() async {
                  //     await Future.delayed(_debounceDuration);
                  //     cardKey.currentState?.toggleCard();
                  //     return value;
                  //   });
                  // },
                  onEditingComplete: () {
                    setState(() {
                      name = textEditController.text;
                    });
                    Future.delayed(const Duration(seconds: 1), () {
                      cardKey.currentState?.toggleCard();
                    });
                  },
                  controller: textEditController,
                  decoration: const InputDecoration(
                    hintText: '이름 (닉네임) 입력',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
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
              color: Colors.amber[300],
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
                          text: name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w600)),
                      const TextSpan(
                          text: ' 님',
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
