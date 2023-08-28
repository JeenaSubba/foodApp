import 'package:get/get.dart';
class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // 797.7142857142857/220 = 3.84;

  static double pageView = screenHeight/2.49;   //797.7142857142857/320
  static double pageViewContainer = screenHeight/3.63;  //797.7142857142857/220
  static double pageViewCTextContainer = screenHeight/6.65; //797.7142857142857/120


  //dynamic height padding and margin
  static double height10 = screenHeight/79.77;   //797.7142857142857/10
  static double height15 = screenHeight/53.18;   //797.7142857142857/15
  static double height20 = screenHeight/39.88;   //797.7142857142857/20
  static double height25 = screenHeight/31.9;   //797.7142857142857/25
  static double height30 = screenHeight/26.59;   //797.7142857142857/30
  static double height45 = screenHeight/17.73;


  //dynamic width
  static double width5 = screenHeight/159.54;
  static double width10 = screenHeight/79.77;   //797.7142857142857/10
  static double width15 = screenHeight/53.18;   //797.7142857142857/15
  static double width20 = screenHeight/39.88;
  static double width25 = screenHeight/31.9;   //797.7142857142857/25
  static double width30 = screenHeight/26.59;
  static double width45 = screenHeight/17.73;



  //font size
  static double font12 = screenHeight/66.48;
  static double font20 = screenHeight/39.88; //797.7142857142857/20
  static double font26 = screenHeight/30.68;

  //Radius
  static double radius5 = screenHeight/159.54;
  static double radius15 = screenHeight/53.18;
  static double radius20 = screenHeight/39.88;
  static double radius30 = screenHeight/26.59;


  //Icon size
  static double iconSize24 = screenHeight/33.24; //797.7142857142857/24
  static double iconSize16 = screenHeight/49.86;

  //Listview size
  static double listViewImgSize = screenWidth/3.43;   //411.42857/120
  static double listViewTextContSize = screenWidth/4.11;  //411.42857/100

  //Popular food page
static double popularFoodImgSize = screenHeight/2.28; //797.7142857142857/350

//bottom height
static double bottomHeightBar = screenHeight/6.65 ; // 797.7142857142857/120



// 805.34     384


}