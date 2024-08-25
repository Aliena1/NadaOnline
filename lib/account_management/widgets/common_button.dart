import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key,this.onPressed,this.title,this.color,this.textColor});
  final title,onPressed,color,textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
