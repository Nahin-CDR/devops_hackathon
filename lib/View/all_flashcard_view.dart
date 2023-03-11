import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../custom_widgets/error.dart';
import '../custom_widgets/flash_category.dart';
import '../custom_widgets/loading.dart';
import '../data/response/status.dart';
import '../view_model/all_flashcard_viewmodel.dart';
class AllFlashCardView extends StatefulWidget {
  const AllFlashCardView({Key? key}) : super(key: key);

  @override
  State<AllFlashCardView> createState() => _AllFlashCardViewState();
}
bool loading = false;
class _AllFlashCardViewState extends State<AllFlashCardView> {

  final AllFlashCardsViewViewModel _allFlashCardsViewViewModel = AllFlashCardsViewViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loading = true;
    });
    Timer(const Duration(seconds: 12), () {
      setState(() {
        loading = false;
      });
    });
    _allFlashCardsViewViewModel.fetchAllFlashCards();
  }

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double multiplier = 2.0;
    return Scaffold(
        backgroundColor: Colors.white,
        body: ChangeNotifierProvider<AllFlashCardsViewViewModel>(
          create: (BuildContext context)=>_allFlashCardsViewViewModel,
          child: Consumer<AllFlashCardsViewViewModel>(
            builder: (context,value,_){
              switch(value.allFlashCards.status){
                case Status.loading:
                  return Center(child: loadingWidget());
                case Status.error:
                  return Center(child: error(conteXt: context, errorMessage: 'Communication error'));//Center(child : Text("Data could not loaded , communication Error",style: TextStyle(color: Colors.deepOrange)));
                case Status.completed:
                  return GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(value.allFlashCards.data.data.length, (index) {
                      dynamic categoryName = value.allFlashCards.data.data[index].category.toString();
                      dynamic thumbnail = value.allFlashCards.data.data[index].thumbnail.toString();
                      return Center(
                        child: flashCategory(
                            imageSize:unitHeightValue*multiplier ,
                            categoryName: categoryName,
                            thumbnailUrl: thumbnail,
                            conteXt: context
                        ),
                      );
                    }
                    ),
                  );
                default:
                  return const Center(child: Text("Default"),);
              }
            },
          ),
        )
    );
  }
}

class FlashCardArguments{
  dynamic categoryName;
  FlashCardArguments({required this.categoryName});
}