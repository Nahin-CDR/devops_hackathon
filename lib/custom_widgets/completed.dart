import 'package:flutter/material.dart';

Widget completed()=>Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(Icons.done_all,color: Colors.green.withOpacity(.5),size: 80),
      Text("No Card left !!",style: TextStyle(color: Colors.grey.withOpacity(.7),fontSize: 30),)
    ],
  ),
);