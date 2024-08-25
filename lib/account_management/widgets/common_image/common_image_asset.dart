import 'package:flutter/cupertino.dart';

class CommonImageAsset extends StatelessWidget {
  const CommonImageAsset({
    super.key,this.image = 'assets/images/logo/sq-logo.png',this.height = 100.0,this.width=120.0
  });
  final image, height,width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        )
      ),
    );
  }
}