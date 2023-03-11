import 'package:dev_ops/resources/apps_url.dart';
import 'package:flutter/foundation.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../model/flashcard_model.dart';
import '../utils/utils.dart';

class FlashCardRepository{
  final BaseApiServices _baseApiServices = NetworkApiServices();

  Future<dynamic>fetchCardsFromApi({required String category})async{
    dynamic response;
    try{
      response = await _baseApiServices.getGetApiResponse('${AppUrl.flashCards}/$category');
      if(kDebugMode){
        print(response);
      }
      return FlashCardModel.fromJson(response);
    }catch(error){
        Utils.toastMessage(message: error.toString());

    }
  }
}