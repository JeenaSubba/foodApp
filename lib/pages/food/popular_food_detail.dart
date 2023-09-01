import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projectviii/controllers/cart_controller.dart';
import 'package:projectviii/controllers/popular_product_controller.dart';
import 'package:projectviii/pages/cart/cart_page.dart';
import 'package:projectviii/pages/home/main_food_page.dart';
import 'package:projectviii/routes/route_helper.dart';
import 'package:projectviii/utils/app_constants.dart';
import 'package:projectviii/utils/colors.dart';
import 'package:projectviii/utils/dimensions.dart';
import 'package:projectviii/widgets/app_column.dart';
import 'package:projectviii/widgets/app_icon.dart';
import 'package:projectviii/widgets/big_text.dart';
import 'package:projectviii/widgets/expandable_text_widget.dart';
import 'package:projectviii/widgets/icon_and_text_widget.dart';
import 'package:projectviii/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetail({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product= Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Background Image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: NetworkImage(
                        AppConstants.BASE_URL + AppConstants.UPLOAD_URL +product.img!,
                      ))
                ) ,
              )),
          //Icon widget
          Positioned(
            top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      if(page=="cartpage"){
                        Get.toNamed(RouteHelper.getCartPage());
                      }else{
                        Get.toNamed(RouteHelper.getInitial());
                      }
                    },
                      child:
                  AppIcon(icon: Icons.arrow_back_ios)),

                  GetBuilder<PopularProductController>(builder: (controller){
                    return GestureDetector(
                      onTap: (){
                        if(controller.totalItems>=1){
                          Get.toNamed(RouteHelper.getCartPage());
                        }else{
                          Get.snackbar("Item Count", "Cart is empty!",
                              backgroundColor: AppColors.secondColor,
                              colorText: Colors.white);
                        }

                      },
                      child: Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined),
                          controller.totalItems>=1?
                            Positioned(
                              right: 0,
                              top:0,

                                child: AppIcon(
                                  icon: Icons.circle,
                                  size: 20,
                                  iconColor:
                                  Colors.transparent,
                                  backgroundColor: AppColors.secondColor,),

                            ):
                          Container(),
                          Get.find<PopularProductController>().totalItems>=1?
                          Positioned(
                            right: 4,
                            top:3,
                            child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                                size: 12, color: Colors.white,
                            ),

                          ):
                          Container(),
                        ],
                      ),
                    );
                  })

                ],

              )
          ),
          //Introduction of food
          Positioned(
            left: 0,
            right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize-30,
              child: Container(  //using container allows us to use padding and margin

                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20)
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.name!,),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Introduction"),
                    SizedBox(height: Dimensions.height20,),
                    //expandable Text Widget
                    Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: product.description))),

                  ],
                ),   //reusing it from widget/ app_column

          )),
          
        ],
      ),

      //Bottom navigation Bar
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
          decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius20*2),
                topLeft: Radius.circular(Dimensions.radius20*2),

              )
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(Icons.remove, color: AppColors.signColor,)),
                    SizedBox(width: Dimensions.width5,),
                    BigText(text: popularProduct.inCartItems.toString()),
                    SizedBox(width: Dimensions.width5,),
                    GestureDetector(
                        onTap: (){
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add, color: AppColors.signColor,)),
                  ],
                ),
              ),


              GestureDetector(
                onTap: (){
                  popularProduct.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                  // child: BigText(text: "\$10 | Add to cart",),

                      child: BigText(text: "Rs.${product.price!} "+" |  Add to cart", color: Colors.white,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.secondColor,
                  ),
                ),
              )
            ],
          ),
        );
      },)
    );
  }
}
