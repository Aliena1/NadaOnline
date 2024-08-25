import 'package:flutter/cupertino.dart';

import '../common_image/common_image_asset.dart';

Padding buildFloatingLogo() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 16), // Adjust bottom padding as needed
    child: CommonImageAsset(),
  );
}

