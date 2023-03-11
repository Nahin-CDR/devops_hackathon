import 'package:flutter/foundation.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../model/all_flashcard_model.dart';
import '../resources/apps_url.dart';
import '../utils/utils.dart';


class AllFlashCardRepository{
  final BaseApiServices _baseApiServices = NetworkApiServices();
  Map uniqueCategory = {}; ///used for filtering unique category flashCards
  List uniqueCategoryList = [];
  Future<dynamic>fetchAllFlashCardsFromApi()async{

    try{
      dynamic response = await _baseApiServices.getGetApiResponse(AppUrl.allFlashCards);
      if(kDebugMode){
        print(response);
      }
      List listResponse = response['data'];
      for (var element in listResponse) {
        /// we are storing every object in map under a unique key
        /// and the key is category
        uniqueCategory[element['category']] = {
          "sn": element['sn'],
          "uid": element['uid'],
          "category": element['category'],
          "question": element['question'],
          "answer": element['answer'],
          "thumbnail": element['thumbnail'],
          "created_date": element['created_date']
        };
      }
      uniqueCategory.forEach((key, value) {
        uniqueCategoryList.add(value);
      });
      Map<String,dynamic> mp ={
        "data" : uniqueCategoryList
      };
      /// code for sharedPref

      return AllFlashCardModel.fromJson(mp);
    }catch(error){
        Utils.toastMessage(message: error.toString());
        //return AllFlashCardModel;
    }
  }
}