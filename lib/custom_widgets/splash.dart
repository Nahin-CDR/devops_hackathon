import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

Widget welcomeText()=> Container(
  margin:const EdgeInsets.only(bottom: 25,top: 0),
  height: 50,
  child: AnimatedTextKit(
    repeatForever: false,
    isRepeatingAnimation: false,
    animatedTexts: [
      TypewriterAnimatedText(
          speed: const Duration(milliseconds: 200),
          'DevOps Hackathon',
          textStyle: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(42, 51, 84, 1)
          )
      ),
    ],
  ),
);