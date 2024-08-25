import 'package:flutter/cupertino.dart';
import '../../../constants/app_color.dart';
import 'common_text_style.dart';

class CommonTextSmall extends StatelessWidget {
  const CommonTextSmall({
    super.key,this.title
  });
  final title;
  @override
  Widget build(BuildContext context) {
    return Text(
        title,
        maxLines: 1, // Limit to 2 lines
        overflow: TextOverflow.ellipsis,
        style: commonTextStyle.copyWith(fontSize: 11,fontWeight: FontWeight.w400,
        color: AppColors.paragraphColor)
    );
  }
}
