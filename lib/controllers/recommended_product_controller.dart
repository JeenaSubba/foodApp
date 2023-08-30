import 'package:get/get.dart';
import 'package:projectviii/data/repository/popular_product_repo.dart';
import 'package:projectviii/data/repository/recommended_product_repo.dart';
import 'package:projectviii/models/products_model.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList =[];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded=> _isLoaded;

  Future<void> getRecommendedProductList()async{
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      _recommendedProductList=[];  //initialize this as null or the data will be repeated
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      _isLoaded = true;
      update();
    }else {
      print(" Could not get  Products recommended");

    }
  }
}