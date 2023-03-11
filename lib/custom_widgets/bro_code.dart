import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

Widget teamName ()=>SizedBox(
  child: Container(
    height: 20,
    margin: const EdgeInsets.all(5.0),
    child:  DefaultTextStyle(
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
      child: AnimatedTextKit(
        repeatForever: true,
        animatedTexts: [
          FadeAnimatedText('Bro Code')
        ],
      ),
    ),
  ),
);