import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectviii/controllers/popular_product_controller.dart';
import 'package:projectviii/controllers/recommended_product_controller.dart';
import 'package:projectviii/pages/home/main_food_page.dart';
import 'package:projectviii/helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();  //makes sure that dependencies are loaded correctly
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

      ),
      home: MainFoodPage(),
      //home: MainFoodPage(),
    );
  }
}
