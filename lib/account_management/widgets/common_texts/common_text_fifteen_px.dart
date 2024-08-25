import 'package:flutter/cupertino.dart';
import '../../../constants/app_color.dart';
import 'common_text_style.dart';

class CommonTextFifteenPx extends StatelessWidget {
  const CommonTextFifteenPx({
    super.key,this.title,this.fontColor = AppColors.headingColor,this.fontWeight = FontWeight.w600,
  });
  final title , fontColor,fontWeight ;
  @override
  Widget build(BuildContext context) {
    return Text(
        title,
        // maxLines: 1, // Limit to 2 lines
        // overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: commonTextStyle.copyWith(fontSize: 15.0,fontWeight: fontWeight,
        color: fontColor)
    );
  }
}

class CommonTextMaxLines2 extends StatelessWidget {
  const CommonTextMaxLines2({
    super.key,this.title,this.fontColor = AppColors.headingColor,this.fontWeight = FontWeight.w600,
  });
  final title , fontColor,fontWeight ;
  @override
  Widget build(BuildContext context) {
    return Text(
        title,
        maxLines: 2, // Limit to 2 lines
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: commonTextStyle.copyWith(fontSize: 15.0,fontWeight: fontWeight,
            color: fontColor)
    );
  }
}
