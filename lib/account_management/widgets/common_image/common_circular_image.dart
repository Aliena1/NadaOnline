import 'package:flutter/cupertino.dart';

import '../../../constants/api_constants/api_constant.dart';

class CommonCircularImage extends StatelessWidget {
  const CommonCircularImage({super.key,this.image});
final image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0,bottom: 16.0),
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(6),
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage("https://dummyjson.com/icon/abc123/150"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
