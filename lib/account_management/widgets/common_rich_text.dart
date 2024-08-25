import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import '../../constants/app_color.dart';


class CommonRichText extends StatelessWidget {
  const CommonRichText({
    super.key, this.textSpanBefore = "New to NBI?", this.textSpanAfter = " Sign up",this.onTap,
    this.fontSize = 16.0
  });
  final textSpanBefore, textSpanAfter,fontSize;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: textSpanBefore,
              style: TextStyle(color: AppColors.paragraphColor,fontSize: fontSize,fontWeight: FontWeight.w400)),
          TextSpan(
              recognizer: TapGestureRecognizer()..onTap = onTap,
              text: textSpanAfter,
              style: const TextStyle(color: AppColors.headingColor,fontSize: 16,fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
