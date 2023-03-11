import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
Widget cardView({
  required index,
  required String question,
  required String answer
})=> Container(
  alignment: Alignment.center,
  child: FlipCard(
      key: Key('flip$index'),
      fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      front: Card(
          margin:const EdgeInsets.all(5),
          elevation: 5,  // Change this
          shadowColor: Colors.blueAccent.withOpacity(.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white.withOpacity(1),
          child: Center(
              child: Container(
                margin:const EdgeInsets.all(10),
                child: Text(question.toString(),
                    style:const TextStyle(
                        fontSize: 18,
                        // fontWeight: FontWeight.bold,
                        color: Colors.black
                    )
                ),
              )
          )
      ),
      back: Card(
          margin:const EdgeInsets.all(5),
          elevation: 5,
          shadowColor: Colors.blueAccent.withOpacity(.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.indigoAccent,
          child: Center(
              child: Container(
                margin: const EdgeInsets.all(10),
                child:  Text(answer.toString(),
                    style:const TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    )
                ),
              )
          )
      )
  ),
);
//
