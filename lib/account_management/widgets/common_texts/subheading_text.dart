import 'package:flutter/cupertino.dart';
import 'common_text_style.dart';

class SubHeadingText extends StatelessWidget {
  const SubHeadingText({
    super.key,this.title
  });
  final title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
        maxLines: 1, // Limit to 2 lines
        overflow: TextOverflow.ellipsis,
      style: commonTextStyle.copyWith(fontSize: 14)
    );
  }
}
