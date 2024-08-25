import 'package:flutter/cupertino.dart';
import '../../../constants/app_color.dart';
import 'common_text_style.dart';

class CommonTextSoftWrap extends StatelessWidget {
  const CommonTextSoftWrap({
    super.key,this.title,this.fontColor = AppColors.headingColor,this.fontWeight = FontWeight.w600,
    this.fontSize = 14.0
  });
  final title , fontColor,fontWeight,fontSize ;
  @override
  Widget build(BuildContext context) {
    return Text(
        title,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: commonTextStyle.copyWith(fontSize: fontSize,fontWeight: fontWeight,
        color: fontColor)
    );
  }
}
