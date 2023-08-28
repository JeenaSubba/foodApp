import 'package:flutter/cupertino.dart';
import 'package:projectviii/utils/dimensions.dart';
import 'package:projectviii/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndText({Key? key,
    required this.icon,
    required this.text,
    required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size:Dimensions.iconSize20),
        SizedBox(width: Dimensions.width5),
        SmallText(text: text,),

      ],

    );
  }
}
