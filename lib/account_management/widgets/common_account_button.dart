import 'package:flutter/material.dart';

import '../../constants/app_color.dart';


class CommonAccountButton extends StatelessWidget {
  const CommonAccountButton({
    super.key,  this.title,this.onPressed
  });
  final title;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.sqEighteenColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
        ),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
