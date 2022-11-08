import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({Key? key}) : super(key: key);

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  int currentAd = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double smallAdHeight = screenSize.width / 5;
    return GestureDetector(
      onHorizontalDragEnd: (_) {
        if (currentAd == (largeAds.length - 1)) {
          currentAd = -1;
        }
        setState(() {
          currentAd++;
        });
      },
      child: Column(
        children: [
          // Image with gradient
          Stack(
            children: [
              Image.network(largeAds[currentAd], width: double.infinity),
              Positioned(
                bottom: 0,
                child: Container(
                  width: screenSize.width,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          backgroundColor,
                          backgroundColor.withOpacity(0),
                        ]),
                  ),
                ),
              )
            ],
          ),
          Container(
            color: backgroundColor,
            width: screenSize.width,
            height: smallAdHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getSmallAdsFromIndex(0, smallAdHeight),
                getSmallAdsFromIndex(1, smallAdHeight),
                getSmallAdsFromIndex(2, smallAdHeight),
                getSmallAdsFromIndex(3, smallAdHeight),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getSmallAdsFromIndex(int index, double height) {
    return Container(
      height: height,
      width: height,
      decoration: ShapeDecoration(
        color: Colors.white,
        shadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(smallAds[index]),
            SizedBox(
              height: 5,
            ),
            Text(adItemNames[index]),
          ],
        ),
      ),
    );
  }
}
