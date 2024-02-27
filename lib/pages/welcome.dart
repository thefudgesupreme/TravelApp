import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/resposive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "Girl-Airport-Illustration.jpg",
    "Girl-Airport-Illustration.jpg",
    "Girl-Airport-Illustration.jpg"
  ];

//  Use to make heading & text dynamic
//   List headings = [
//     "Heading 1",
//     "Heading 2",
//     "Heading 3",
//   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: images.length,
            itemBuilder: (_, index) {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: const Alignment(1.5, 1.0),
                        image: AssetImage(
                          // ignore: prefer_interpolation_to_compose_strings
                          "assets/imgs/" + images[index],
                        ),
                        fit: BoxFit.contain)),
                child: Container(
                  margin: const EdgeInsets.only(top: 105, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(
                            // text: headings[index], //Dynamic Headings/Texts
                            text: "Trips to",
                          ),
                          AppText(
                            text: 'Mountains',
                            color: Colors.black87,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 250,
                            child: AppText(
                                text:
                                    "Mountain hikes give you an incredible sense of freedom alongwith endurance tests..!!",
                                color: Colors.black54,
                                size: 15),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          ResponsiveButton(
                            width: 150,
                          ),
                        ],
                      ),
                      Column(
                        children: List.generate(3, (sliderIndex) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: index == sliderIndex ? 25 : 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == sliderIndex
                                    ? AppColors.mainColor
                                    : AppColors.mainColor.withOpacity(0.3)),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
