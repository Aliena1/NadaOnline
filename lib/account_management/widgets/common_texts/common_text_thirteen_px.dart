import 'package:flutter/cupertino.dart';
import 'common_text_style.dart';

class CommonTextThirteenPx extends StatelessWidget {
  const CommonTextThirteenPx({
    super.key,this.title,this.fontColor,this.fontSize = 13.0,this.fontWeight= FontWeight.w400
  });
  final title , fontColor, fontSize,fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
        title,
        maxLines: 1, // Limit to 2 lines
        overflow: TextOverflow.ellipsis,
        style: commonTextStyle.copyWith(fontSize: fontSize,fontWeight: fontWeight,
        color: fontColor)
    );
  }
}
