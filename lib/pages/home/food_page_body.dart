import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectviii/utils/colors.dart';
import 'package:projectviii/utils/dimensions.dart';
import 'package:projectviii/widgets/app_column.dart';
import 'package:projectviii/widgets/big_text.dart';
import 'package:projectviii/widgets/icon_and_text_widget.dart';
import 'package:projectviii/widgets/small_text.dart';


class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        //Slider section
        Container(
          // color: Colors.grey,
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _PageInsideBody(position);
              }),
        ),
        //dots
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue.toInt(),
          decorator: DotsDecorator(
            activeColor: AppColors.secondColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius5)),
          ),
        ),
        
        //Popular Section
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26,),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food Pairing",),
              )
            ],
          ),
        ),
        SizedBox(height: Dimensions.height30,),
        //List of food and images

          ListView.builder(     //parent container of list view builder needs to have certain height
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom:  Dimensions.height10),
                  child: Row(
                    children: [

                      //Image section
                      Container(
                        width: Dimensions.listViewImgSize,
                        height: Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white38,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/image/food0.png"
                                )
                            )
                        ),
                      ),

                      //Text Section
                      Expanded(
                        child: Container(
                          height: Dimensions.listViewTextContSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            color: Colors.white,

                          ) ,
                          child: Padding(
                            padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,  //horizontal
                              mainAxisAlignment: MainAxisAlignment.center , //Vertical
                              children: [
                                BigText(text: "Nutritous fruit meal in Nepal"),
                                SizedBox(height: Dimensions.height10,),
                                SmallText(text: "With Nepalese characterristics"),
                                SizedBox(height: Dimensions.height10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndText(
                                      icon: Icons.circle_sharp,
                                      text: "Normal",
                                      iconColor:
                                      AppColors.iconColor1,), //Original Iconcolor1
                                    IconAndText(
                                        icon: Icons.location_on,
                                        text: "1.7km",
                                        iconColor: AppColors.mainColor),
                                    IconAndText(
                                        icon: Icons.access_time_rounded,
                                        text: "Normal",
                                        iconColor: AppColors.iconColor2),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),

                      )
                    ],
                  ),
                );
              }),

        
      ],
    );
  }

  Widget _PageInsideBody(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0xFFD52E2D) : Color(0xFFDD7171),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/front1.png"))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewCTextContainer,
              margin: EdgeInsets.only(left:Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left:Dimensions.height15 , right: Dimensions.height15),
                child: AppColumn(text:" Mo:Mo Hub" ,),  //reusing it from widget/ app_column
              ),
            ),
          ),
        ],
      ),
    );
  }
}
