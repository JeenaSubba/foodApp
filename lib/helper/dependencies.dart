import 'package:get/get.dart';
import 'package:projectviii/controllers/cart_controller.dart';
import 'package:projectviii/controllers/popular_product_controller.dart';
import 'package:projectviii/controllers/recommended_product_controller.dart';
import 'package:projectviii/data/api/api_client.dart';
import 'package:projectviii/data/repository/cart_repo.dart';
import 'package:projectviii/data/repository/popular_product_repo.dart';
import 'package:projectviii/data/repository/recommended_product_repo.dart';
import 'package:projectviii/utils/app_constants.dart';


Future<void> init()async{

  //api client)
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());


  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}

