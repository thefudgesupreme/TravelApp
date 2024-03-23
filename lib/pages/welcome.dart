import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
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
    "welcome1.jpeg",
    "welcome2.jpeg",
    "welcome3.jpeg",
  ];

//  Use to make heading & text dynamic
  List headings = [
    "Beaches",
    "Deserts",
    "Mountains",
  ];
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
                        // alignment: const Alignment(1.5, 1.0),
                        image: AssetImage(
                          // ignore: prefer_interpolation_to_compose_strings
                          "assets/imgs/" + images[index],
                        ),
                        fit: BoxFit.cover)),
                child: Container(
                  margin: const EdgeInsets.only(top: 105, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(
                            text: "Trips to",
                          ),
                          AppText(
                            text: headings[index], //Dynamic Headings/Texts
                            // text: 'Mountains',
                            color: Colors.black87,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 250,
                            child: AppText(
                                text: headings[index] +
                                    " give you an incredible sense of freedom alongwith endurance tests..!!",
                                color: Colors.black54,
                                size: 15),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () =>
                                BlocProvider.of<AppCubits>(context).getData(),
                            child: SizedBox(
                              width: 200,
                              child: ResponsiveButton(
                                width: 150,
                              ),
                            ),
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
