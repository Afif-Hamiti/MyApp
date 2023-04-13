import 'package:MyMedice/src/common_widgets/fade__in_animation/animation_design.dart';
import 'package:MyMedice/src/common_widgets/fade__in_animation/fade_in_animation_model.dart';
import 'package:MyMedice/src/constants/colors.dart';
import 'package:MyMedice/src/constants/image_strings.dart';
import 'package:MyMedice/src/constants/sizes.dart';
import 'package:MyMedice/src/constants/text_strings.dart';
import 'package:MyMedice/src/common_widgets/fade__in_animation/fade_in_animationcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1600,
            animatePosition: TAnimatePosition(
              topAfter: 20,
              topBefore: -100,
              tleftAfter: 20,
              tleftBefore: -100,
            ),
            child: const Image(image: AssetImage(tSplashTopIcon)),
          ),
          TFadeInAnimation(
            durationInMs: 2000,
            animatePosition: TAnimatePosition(
                tbottomAfter: 140,
                tbottomBefore: 80,
                tleftAfter: tDefaultSize * 4,
                tleftBefore: -180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tAppName, style: Theme.of(context).textTheme.headline3),
                Text(tAppTagLine, style: Theme.of(context).textTheme.headline2)
              ],
            ),
          ),
          TFadeInAnimation(
            durationInMs: 2400,
            animatePosition: TAnimatePosition(
                tleftBefore: -320,
                tleftAfter: 20,
                tbottomBefore: -30,
                tbottomAfter: 230),
            child: Image.asset(tSplashImage,
                color: isDarkMode ? tWhiteColor : tDarkColor),
          ),
          TFadeInAnimation(
            durationInMs: 2400,
            animatePosition: TAnimatePosition(
                tbottomBefore: -70,
                tbottomAfter: 60,
                trightBefore: tDefaultSize,
                trightAfter: tDefaultSize),
            child: Container(
              width: tSplashContainerSize,
              height: tSplashContainerSize,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: tPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
