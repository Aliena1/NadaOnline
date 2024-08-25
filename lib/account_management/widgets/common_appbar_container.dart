import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CommonAppbarContainer extends StatelessWidget {
  final String? title;
  final bool? fromResetPw;

  const CommonAppbarContainer({
    super.key,
    this.title,
    this.fromResetPw = false,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200 + MediaQuery.of(context).padding.top,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(opacity: 0.9,
            fit: BoxFit.cover,
            // width: double.infinity,
            // height: double.infinity,
            image: AssetImage('assets/images/pictures/login-bg.png',
            )),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: fromResetPw == true?
                IconButton(
                  onPressed: (){Get.back();},
                  icon:Icon(Icons.arrow_back_ios),color: Colors.white,):
                Container(),
              )),

          Visibility(
            visible: false,
            child: Container(
              padding: EdgeInsets.all(10),
              width: 60, // Adjust width as needed
              height:60, // Adjust height as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,

              ),
              child: Image.asset(
                'assets/images/logo/sq-logo.png',
                width: 50, // Adjust width as needed
                height: 50, // Adjust height as needed
              ),
            ),
          ),
          SizedBox(height: 40,),
          // Text
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0,left: 20.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title!,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),

    );


  }
}
