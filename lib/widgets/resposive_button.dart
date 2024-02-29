import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResposive;
  double? width;
  double? height;
  ResponsiveButton(
      {super.key,
      this.isResposive = false,
      this.width = 120,
      this.height = 60});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResposive == true ? double.maxFinite : width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor),
        child: Row(
          mainAxisAlignment: isResposive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResposive == true
                ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppText(
                      text: "Book Trip Now",
                      size: 20,
                      color: Colors.white,
                    ),
                  )
                : Container(),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Image(
                image: AssetImage(
                  "assets/imgs/arrow_right_icon.png",
                ),
                fit: BoxFit.scaleDown,
              ),
            )
          ],
        ),
      ),
    );
  }
}
