import 'package:get/get.dart';
import 'package:projectviii/controllers/popular_product_controller.dart';
import 'package:projectviii/data/api/api_client.dart';
import 'package:projectviii/data/repository/popular_product_repo.dart';

Future<void> init()async{

  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: "https://www.ccc.com"));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}