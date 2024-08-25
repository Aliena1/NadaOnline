import 'package:flutter/cupertino.dart';
import '../../../constants/api_constants/api_constant.dart';
import '../../../constants/app_color.dart';

class CommonImageNetwork extends StatelessWidget {
   CommonImageNetwork({
    super.key, this.image,this.width = 162.0,this.height=100.0
  });
  final image;
  var width,height;

  @override
  Widget build(BuildContext context) {
    // print('image ==');
    // print(ApiConstants.BASE_URL+image);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image:NetworkImage(ApiConstants.BASE_URL+image),
            fit: BoxFit.cover,
        ),
        color: AppColors.bgGreyColor,
        borderRadius: BorderRadius.circular(5),),
      width: width,
      height: height,
      margin: EdgeInsets.all(8),
    );
  }
}
