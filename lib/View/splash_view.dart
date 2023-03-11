import 'dart:async';
import 'package:dev_ops/custom_widgets/home.dart';
import 'package:dev_ops/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../custom_widgets/bro_code.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, RoutesName.allFlashCards);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width-50,
                      ),
                welcomeText(),
                const SizedBox(height: 15),
                const Center(
                  child: SpinKitCircle(
                    color: Colors.white,
                  ),
                ),
              ],)),

              Expanded (
                flex: 1,
                child : Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      height: 30,
                      child: teamName(),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      )
    );
  }
}
