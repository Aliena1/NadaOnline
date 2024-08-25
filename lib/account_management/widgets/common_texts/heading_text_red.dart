import 'package:flutter/cupertino.dart';
import '../../../constants/app_color.dart';
import 'common_text_style.dart';

class HeadingTextRed extends StatelessWidget {
  const HeadingTextRed({
    super.key, this.title
  });
  final title;

  @override
  Widget build(BuildContext context) {
    return Text(title,style:commonTextStyle.copyWith(
        fontWeight: FontWeight.w700,color: AppColors.primaryRedColor,
        fontSize: 16.0),);
  }
}
