import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectviii/data/repository/popular_product_repo.dart';
import 'package:projectviii/models/products_model.dart';
import 'package:projectviii/utils/app_constants.dart';
import 'package:projectviii/utils/colors.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList =[];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded=> _isLoaded;

  int _quantity =0;
  int get quantity => _quantity;

  int _inCartItems=0;
  int get inCartItems=> _inCartItems+_quantity;

  Future<void> getPopularProductList()async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      print("Got Products");
      _popularProductList=[];  //initialize this as null or the data will be repeated
      _popularProductList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
       _isLoaded = true;
      update();
    }else {


    }
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity = checkQuantity(_quantity+1);
    }else{
      _quantity = checkQuantity(_quantity-1);
    }
    update();  //UI will know immediately that there in change in value
  }
  int checkQuantity(int quantity){
    if(quantity<0){
      Get.snackbar("Item Count", "You cannot reduce more !",
      backgroundColor: AppColors.secondColor,
      colorText: Colors.white);
      return 0;
    }else if(quantity>20){
      Get.snackbar("Item Count", "You cannot add more !",
          backgroundColor: AppColors.secondColor,
          colorText: Colors.white);
      return 20;
    }else{
      return quantity;
    }
  }

  void initProduct(){
    _quantity = 0;
    _inCartItems=0;
    //if exists then
    //get from storage _intCartItems

  }
}