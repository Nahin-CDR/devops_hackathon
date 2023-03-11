import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices{
  @override
  Future getGetApiResponse(String url) async{
   try{
     final http.Response response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
     return returnResponse(response);
   }on SocketException{
     throw FetchDataException('No internet connection');
   }
  }
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnAuthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error occurred while communicating with server with status code ${response.statusCode}');
    }
  }
}