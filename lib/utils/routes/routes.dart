import 'package:dev_ops/View/flashcard_view.dart';
import 'package:dev_ops/View/splash_view.dart';
import 'package:dev_ops/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

import '../../View/all_flashcard_view.dart';


class Routes{
  static Route<dynamic>generateRoute(RouteSettings settings){
    switch(settings.name){

      case RoutesName.splashView:
        return MaterialPageRoute(builder: (BuildContext context)=> const SplashView());
      case RoutesName.allFlashCards:
        return MaterialPageRoute(builder: (BuildContext context)=>const AllFlashCardView());
      case RoutesName.flashCardView:
        final arguments = settings.arguments as FlashCardArguments;
        return MaterialPageRoute(builder: (BuildContext context)=> FlashCardView(categoryName: arguments.categoryName));
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text("No routes defined"),
            ),
          );
        });
    }
  }
}