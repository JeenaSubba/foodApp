import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectviii/pages/food/popular_food_detail.dart';
import 'package:projectviii/pages/food/recommended_food_details.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

      ),
      home: RecommendedFoodDetails(),
      //home: MainFoodPage(),
    );
  }
}
