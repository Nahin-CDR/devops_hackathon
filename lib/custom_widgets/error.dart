import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget error({
  required BuildContext conteXt,
  required String errorMessage,
})=> Center(
  child:Container(
    height: MediaQuery.of(conteXt).size.height/2,
    margin:const EdgeInsets.all(20),
    child: Card(
      color: Colors.white,
      margin:const EdgeInsets.all(5),
      //elevation: 10,  // Change this
      shadowColor: Colors.blueAccent.withOpacity(.2),
      // clipBehavior: Clip.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        decoration: const BoxDecoration(),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:
                  [
                    Container(
                        margin: const EdgeInsets.only(bottom:15,right: 20),
                        child: const Text("Ops !",style: TextStyle(
                            fontFamily: AutofillHints.birthday,
                            fontSize: 40,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                        ),)
                    ),
                  ],
                )
            ),
            SizedBox(height:MediaQuery.of(conteXt).size.width/8),
            Expanded(
                flex: 2,
                child: SpinKitFadingCube(
                  color: Colors.blueAccent.withOpacity(.2),
                  size: 100,
                )//FaIcon(FontAwesomeIcons.arrowDown), //Icon(Icons.error_outline,color: Colors.deepOrange,size: 50)
            ),
            Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin:const EdgeInsets.all(10),
                  child: Text(
                      errorMessage.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.deepOrange.withOpacity(.8)
                      )
                  ),
                )
            )
          ],
        ),
      ),
    ),
  ),
);
