import 'package:flutter/cupertino.dart';

import 'common_text_style.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({
    super.key,this.title,this.fontSize = 32.0
  });
  final title,fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: commonTextStyle.copyWith(fontSize:fontSize)
    );
  }
}
