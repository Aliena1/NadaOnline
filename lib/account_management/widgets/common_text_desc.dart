import 'package:flutter/cupertino.dart';

import '../../constants/app_color.dart';

class CommonTextDesc extends StatelessWidget {
  const CommonTextDesc({
    super.key, this.desc
  });
  final desc;

  @override
  Widget build(BuildContext context) {
    return Text(desc,
      style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.headingColor),);
  }
}

class CommonTextDescMaxLine extends StatelessWidget {
  const CommonTextDescMaxLine({
    super.key, this.desc
  });
  final desc;

  @override
  Widget build(BuildContext context) {
    return Text(desc,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.headingColor),);
  }
}
