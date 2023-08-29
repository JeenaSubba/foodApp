import 'package:get/get.dart';
import 'package:projectviii/data/api/api_client.dart';
import 'package:projectviii/utils/app_constants.dart';

class PopularProductRepo extends GetxService{   //to load data from internet we need Getxservice
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }

}