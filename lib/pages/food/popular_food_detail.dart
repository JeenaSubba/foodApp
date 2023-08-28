import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectviii/utils/colors.dart';
import 'package:projectviii/utils/dimensions.dart';
import 'package:projectviii/widgets/app_column.dart';
import 'package:projectviii/widgets/app_icon.dart';
import 'package:projectviii/widgets/big_text.dart';
import 'package:projectviii/widgets/expandable_text_widget.dart';
import 'package:projectviii/widgets/icon_and_text_widget.dart';
import 'package:projectviii/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      image: AssetImage(
                          "assets/image/food0.png"
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
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ],

              )
          ),
          //Introduction of food
          Positioned(
            left: 0,
            right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize-30,
              child: Container(  //using conating allows us to use padding and margin

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
                    AppColumn(text: "Mo:Mo Hub",),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Introduction"),
                    //expandable Text Widget
                    ExpandableTextWidget(text: "Chicken Momo is a dish that needs no introduction. However, it is pretty easy to prepare it at home without putting in much effort. Here’s how you go about preparing it at home: To begin with, rinse the veggies and chicken with lukewarm water to thoroughly clean them. Then take a clean chopping board, chop the vegetables separately and keep them aside. Then take a pan or a pressure cooker and boil the chicken, with a pinch of salt and pepper. If you want to make it aromatic, you can add a small teaspoon of ginger and chilli garlic paste. If you like the flavour of garlic, you can add some more garlic paste. Once done, carefully mince the boiled chicken. Keep it aside."),
                  ],
                ),   //reusing it from widget/ app_column

          )),
          
        ],
      ),

      //Bottom navigation Bar
      bottomNavigationBar: Container(
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
                  Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width5,),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width5,),
                  Icon(Icons.add, color: AppColors.signColor,),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              // child: BigText(text: "\$10 | Add to cart",),
              child: BigText(text: "Rs.250 | Add to cart", color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.secondColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
