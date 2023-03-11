import 'package:flutter/material.dart';
import '../data/response/api_response.dart';
import '../model/flashcard_model.dart';
import '../repository/flashcard_repo.dart';
import '../utils/utils.dart';

class FlashCardViewViewModel with ChangeNotifier{

  final _myRepo = FlashCardRepository();
  ApiResponse<FlashCardModel>flashCards = ApiResponse.loading();

  setFlashCards(ApiResponse<FlashCardModel>response){
    flashCards = response;
    notifyListeners();
  }
  Future<void> fetchFlashCards({required String categoryName})async {
    setFlashCards(ApiResponse.loading());
    _myRepo.fetchCardsFromApi(category: categoryName).then((value) {
      if(value != null){
        setFlashCards(ApiResponse.completed(value));
      }else{
        setFlashCards(ApiResponse.error('Error'));
      }
    }).onError((error, stackTrace) {
      setFlashCards(ApiResponse.error(error.toString()));
      Utils.toastMessage(message: error.toString());
    });
  }
}