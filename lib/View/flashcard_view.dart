import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import '../custom_widgets/card.dart';
import '../custom_widgets/completed.dart';
import '../custom_widgets/error.dart';
import '../custom_widgets/loading.dart';
import '../data/response/status.dart';
import '../view_model/flashcard_viewmodel.dart';


class FlashCardView extends StatefulWidget {
  final String categoryName;
  const FlashCardView({Key? key,required this.categoryName}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<FlashCardView> createState() => _FlashCardViewState(categoryName: categoryName);
}

class _FlashCardViewState extends State<FlashCardView> {
  final String categoryName;
  bool isCompleted = false;
  SwipeableCardSectionController cardController = SwipeableCardSectionController();
  int track = 0;
  int counter = 3;
  _FlashCardViewState({required this.categoryName});
  final FlashCardViewViewModel _flashCardViewViewModel = FlashCardViewViewModel();
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      setState(() {
        loading = false;
      });
    });
    _flashCardViewViewModel.fetchFlashCards(categoryName: categoryName);
  }

  @override
  Widget build(BuildContext conteXt) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double multiplier = 2.0;
    return Scaffold(
        body:isCompleted?completed():ChangeNotifierProvider<FlashCardViewViewModel>(
          create: (BuildContext context) => _flashCardViewViewModel,
          child: Consumer<FlashCardViewViewModel>(
            builder: (context,value,_){
              switch(value.flashCards.status){
                case Status.loading:
                  return Center(
                    child: loadingWidget(),
                  );
                case Status.error:
                  return Center(child: error(conteXt: context, errorMessage: 'Communication error'));
                case Status.completed:
                  if(value.flashCards.data!.data.length<3){
                    return Container(
                        margin: const EdgeInsets.all(5),
                        child:error(conteXt: conteXt,errorMessage: "At least 3 Card is needed to show the stack,Server serves less than 3")
                    );
                  }else{
                    return Column(
                      children: [
                        //SizedBox(height: MediaQuery.of(context).size.width/2-30),
                        SwipeableCardsSection(
                          cardController: cardController,
                          context: context,
                          //add the first 3 cards
                          items: [
                            cardView(question: _flashCardViewViewModel.flashCards.data!.data[0].question,
                                answer:  _flashCardViewViewModel.flashCards.data!.data[0].answer,
                                index: 0
                            ),
                            cardView(question: _flashCardViewViewModel.flashCards.data!.data[1].question,
                                answer:  _flashCardViewViewModel.flashCards.data!.data[1].answer,
                                index: 1
                            ),
                            cardView(question: _flashCardViewViewModel.flashCards.data!.data[2].question,
                                answer:  _flashCardViewViewModel.flashCards.data!.data[2].answer,
                                index: 2
                            ),
                          ],
                          onCardSwiped: (dir, index, widget) {
                            track++;
                            setState(() {
                              track;
                            });
                            //Add the next card
                            if (counter < _flashCardViewViewModel.flashCards.data!.data.length) {
                              if(kDebugMode){
                                print(counter);
                              }
                              cardController.addItem(
                                  cardView(
                                      question:_flashCardViewViewModel.flashCards.data!.data[counter].question,
                                      answer:_flashCardViewViewModel.flashCards.data!.data[counter].question,
                                      index: counter
                                  )
                              );
                              counter++;
                            }
                            if(track == _flashCardViewViewModel.flashCards.data!.data.length)
                            {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      actionsAlignment: MainAxisAlignment.center,
                                      icon:const Icon(Icons.done_all,color: Colors.green,size: 25),
                                      backgroundColor: Colors.white,
                                      title: const Text("Congratulations!", style: TextStyle(color: Colors.blue)),
                                      content:const Text("You have completed all the flashCards.",
                                          style: TextStyle(color: Colors.black,fontSize: 16)
                                      ),
                                      actions: <Widget>[
                                        Center(
                                          child: ElevatedButton(
                                            onPressed: (){
                                              if(Navigator.canPop(context)) {
                                                Navigator.pop(context);
                                                setState(() {
                                                  isCompleted = true;
                                                });
                                              }
                                            },
                                            child:const Text("OK"),
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                              );
                            }
                          },
                          enableSwipeUp: true,
                          enableSwipeDown: true,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width/2-60,
                          child: Center(
                            child:  Text("$track/${_flashCardViewViewModel.flashCards.data!.data.length}",style:const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                          ),
                        ),
                      ],
                    );
                  }
                default:
                  return const Text("Default");
              }
            },
          ),
        )
    );

  }
}
