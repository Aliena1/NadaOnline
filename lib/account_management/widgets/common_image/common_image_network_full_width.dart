import 'package:flutter/cupertino.dart';
import '../../../constants/api_constants/api_constant.dart';
import '../../../constants/app_color.dart';

class CommonImageNetworkFullWidth extends StatelessWidget {
  const CommonImageNetworkFullWidth({
    super.key, this.image,this.width=170.0,this.height=130.0
  });
  final image,width,height;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(ApiConstants.BASE_URL+image),
            fit: BoxFit.cover,),
        color: AppColors.bgGreyColor,
        borderRadius: BorderRadius.circular(10),),
      width: width,
      height: height,
    );
  }
}
