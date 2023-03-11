import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loadingWidget()=>const Center(
  child: SpinKitCircle(
      color: Colors.blueGrey,
      size: 50
  ),
);