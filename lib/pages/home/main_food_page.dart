import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectviii/pages/home/food_page_body.dart';
import 'package:projectviii/utils/colors.dart';
import 'package:projectviii/utils/dimensions.dart';
import 'package:projectviii/widgets/big_text.dart';
import 'package:projectviii/widgets/small_text.dart';



class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
     // print("current height"+MediaQuery.of(context).size.height.toString());
     // print("current width"+MediaQuery.of(context).size.width.toString());

     return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Kathmandu", color: AppColors.secondColor),
                      Row(
                        children: [
                          SmallText(text: "Pepsicola", color: Colors.black54, ),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )

                    ],
                  ),
                  Container(
                    width: Dimensions.width45,
                    height: Dimensions.height45,
                    child: Icon(Icons.search, color: Colors.white, size:Dimensions.iconSize24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.secondColor,
                      // color: AppColors.mainColor,
                    ),

                  ),

                ],
              ),
            ),
          ),

          //showing the body
          Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          )),
        ],
      ),
    );
  }
}
