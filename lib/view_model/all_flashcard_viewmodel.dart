import 'package:flutter/material.dart';

import '../data/response/api_response.dart';
import '../repository/all_flashcard_repository.dart';
import '../utils/utils.dart';


class AllFlashCardsViewViewModel with ChangeNotifier{

  final _myRepo = AllFlashCardRepository();

  ApiResponse<dynamic> allFlashCards = ApiResponse.loading();

  setFlashCards(ApiResponse<dynamic>response){
    allFlashCards = response;
    notifyListeners();
  }

  Future<void>  fetchAllFlashCards() async{
    setFlashCards(ApiResponse.loading());
    _myRepo.fetchAllFlashCardsFromApi().then((value) {
      if(value != null){
        setFlashCards(ApiResponse.completed(value));
      }else{
        setFlashCards(ApiResponse.error("error"));
      }
    }).onError((error, stackTrace) {
      setFlashCards(ApiResponse.error(error.toString()));
      Utils.toastMessage(message: error.toString());
    });
  }
}