import 'package:get/get.dart';
import 'package:projectviii/utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;  //map is for storing data locally in key value pair

  ApiClient({ required this.appBaseUrl}){
    baseUrl = appBaseUrl;    //getx service package
    timeout = Duration(seconds: 30);
    token=AppConstants.TOKEN;
    _mainHeaders={
      'Content-type':'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
  Future<Response> getData(String uri,) async {
    try{
      Response response = await get(uri);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}