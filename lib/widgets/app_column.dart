import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectviii/utils/colors.dart';
import 'package:projectviii/utils/dimensions.dart';
import 'package:projectviii/widgets/big_text.dart';
import 'package:projectviii/widgets/icon_and_text_widget.dart';
import 'package:projectviii/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26,),
        SizedBox(
          height: Dimensions.height10,
        ),
        //comment section
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  size:Dimensions.iconSize24, //added
                  color: AppColors.secondColor,
                );
              }),
            ),
            SizedBox(width: Dimensions.width5),
            SmallText(text: "4.5"),
            SizedBox(width: Dimensions.width5),
            SmallText(text: "1287"),
            SizedBox(width: Dimensions.width5),
            SmallText(text: "Comments")
          ],
        ),
        SizedBox(
          height: Dimensions.height15,
        ),
        //time and distance section
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
    );
  }
}
