import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  List sports = ["Skateboarding", "Biking", "Skateboarding", "Biking"];
  List sportsImg = [
    "skateboarding.png",
    "biking.png",
    "skateboarding.png",
    "biking.png"
  ];
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ),
                Expanded(child: Container()),
                Container(
                  // padding: const EdgeInsets.only(right: 100),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
              padding: const EdgeInsets.only(left: 20),
              child: AppLargeText(text: "Discover")),
          const SizedBox(
            height: 30,
          ),

          // TabBar
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                controller: _tabController,
                tabAlignment: TabAlignment.start,
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                // labelStyle: TextStyle(fontFamily: ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                dividerColor: Colors.transparent,
                indicator:
                    CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                tabs: const [
                  Tab(
                    text: "Places",
                  ),
                  Tab(
                    text: "Inspiration",
                  ),
                  Tab(
                    text: "Emotions",
                  ),
                ]),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(controller: _tabController, children: [
              ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 15, top: 10),
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: const DecorationImage(
                            image: AssetImage("assets/imgs/mountain.jpg"),
                            fit: BoxFit.cover)),
                  );
                },
              ),
              AppText(text: "Inspiration"),
              AppText(text: "Emotions"),
            ]),
          ),

          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: "Explore",
                  size: 22,
                ),
                AppText(
                  text: "See all",
                  color: AppColors.mainColor,
                  size: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
              height: 120,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage(
                                        // ignore: prefer_interpolation_to_compose_strings
                                        "assets/imgs/" + sportsImg[index]),
                                    fit: BoxFit.cover)),
                          ),
                          Text(sports[index])
                        ],
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter

    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2, configuration.size!.height);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
