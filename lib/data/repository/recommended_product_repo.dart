import 'package:get/get.dart';
import 'package:projectviii/data/api/api_client.dart';
import 'package:projectviii/utils/app_constants.dart';

class RecommendedProductRepo extends GetxService{   //to load data from internet we need Getxservice
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async{
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }

}