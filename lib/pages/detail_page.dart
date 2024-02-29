import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/resposive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int rating = 3;
  int selIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 400,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/imgs/bg.jpg"),
                            fit: BoxFit.cover)),
                  )),
              Positioned(
                  left: 15,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                        color: Colors.white,
                      ),
                      const SizedBox(width: 300),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert_outlined),
                        color: Colors.white,
                      ),
                    ],
                  )),
              Positioned(
                  top: 280,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 450,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: "Yosemite",
                              color: Colors.black54,
                            ),
                            AppLargeText(
                              text: "\$ 250",
                              color: AppColors.mainColor.withOpacity(.8),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            AppText(
                              text: "USA, California",
                              size: 15,
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Container(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Icon(
                                    size: 15,
                                    Icons.star,
                                    color: index < rating
                                        ? AppColors.starColor
                                        : Colors.white,
                                    shadows: [
                                      Shadow(
                                          blurRadius: 2,
                                          color: index < rating
                                              ? Colors.amber
                                              : Colors.black.withOpacity(.75))
                                    ],
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: "($rating.0)",
                              color: AppColors.textColor2,
                              size: 15,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                          text: "People",
                          size: 20,
                          color: Colors.black.withOpacity(.8),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: "No. of People in your group",
                          color: AppColors.mainTextColor,
                          size: 15,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButtons(
                                    isIcon: false,
                                    text: (index + 1).toString(),
                                    // To display icons
                                    // isIcon: true,
                                    // icon: Icons.favorite_rounded,
                                    color: selIndex != index
                                        ? Colors.black
                                        : Colors.white,
                                    bgcolor: selIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    bordercolor: selIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    size: 50),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                          text: "Description",
                          color: AppColors.bigTextColor,
                          size: 25,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text:
                              "Yosemite National Park includes nearly 1,200 square miles of mountainous scenery, including high cliffs, deep valleys, tall waterfalls, ancient giant sequoias, and a large wilderness.",
                          size: 15,
                          weight: FontWeight.w300,
                        ),
                      ],
                    ),
                  )),
              Positioned(
                left: 20,
                bottom: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                      isIcon: true,
                      icon: Icons.favorite_border,
                      color: AppColors.mainColor,
                      bgcolor: Colors.white,
                      bordercolor: AppColors.mainColor,
                      size: 60,
                      borderradius: 10,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ResponsiveButton(
                      isResposive: true,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
