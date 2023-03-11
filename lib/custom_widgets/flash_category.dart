import 'package:flutter/material.dart';

import '../View/all_flashcard_view.dart';
import '../utils/routes/routes_name.dart';


Widget flashCategory({
  required dynamic imageSize,
  required dynamic categoryName,
  required dynamic thumbnailUrl,
  required BuildContext conteXt
})=>Card(
  elevation: 4,
  shadowColor: Colors.blueAccent.withOpacity(.5),
  clipBehavior: Clip.hardEdge,
  child: InkWell(
    splashColor: Colors.blue.withAlpha(30),
    onTap: () {
      Navigator.pushNamed(
          conteXt,
          RoutesName.flashCardView,
          arguments: FlashCardArguments(categoryName: categoryName)
      );
    },
    child: Container(
        margin:const EdgeInsets.all(10),
        width: MediaQuery.of(conteXt).size.width/2-50,
        height: MediaQuery.of(conteXt).size.width/2-50,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Image(image: NetworkImage(
                thumbnailUrl.toString()),
              height:imageSize*5,
              width: imageSize*5,
              errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.error_outline,
                  size: 40,
                  color:Colors.black.withOpacity(.4)
              ),
            ),
            const Positioned(
              top: 0,
              child: Padding(
                padding: EdgeInsets.all(5),
                child:  Divider(
                    color: Colors.blueAccent,
                    thickness: 1
                ),
              ),),
            Positioned(
              bottom: 5,
              left: 20,
              child:  Text(categoryName,style:const TextStyle(fontSize: 15,color: Colors.black)),
            ),
          ],
        )
    ),
  ),
);