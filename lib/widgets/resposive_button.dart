import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResposive;
  double? width;
  ResponsiveButton({super.key, this.isResposive = false, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.mainColor),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Image(
              image: AssetImage(
                "assets/imgs/arrow_right_icon.png",
              ),
              fit: BoxFit.scaleDown,
            ),
          )
        ],
      ),
    );
  }
}
