import 'package:flash_card/flash_card.dart';
import 'package:flash_card/flash_card_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<FlashCard> _flashCards=[
    FlashCard(questions: "What Is Your Name", answere: "My Name Is Joy"),
    FlashCard(questions: "How Old Are You", answere: "I am 25 Years Old"),
    FlashCard(questions: "What Is Your Favourite Programming Language", answere: "Dart"),
  ];

  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250,
                    width: 250,
                  ///Flip Card Is A External Library
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: FlipCard(
                      front: FlashCardView(text: _flashCards[_currentIndex].questions),
                      back: FlashCardView(text: _flashCards[_currentIndex].answere),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: (){setState(() {
                        _currentIndex!=0?_currentIndex=_currentIndex-1:_currentIndex=_currentIndex;
                      });},
                      icon: Icon(Icons.chevron_left),
                      label: Text('Prev'),),
                    ElevatedButton.icon(
                      onPressed: (){setState(() {
                        _currentIndex>=_flashCards.length-1?_currentIndex=_currentIndex:_currentIndex=_currentIndex+1;
                      });},
                      icon: Icon(Icons.chevron_right),
                      label: Text('Next'),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
