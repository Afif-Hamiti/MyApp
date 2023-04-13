import 'package:MyMedice/src/common_widgets/fade__in_animation/fade_in_animation_model.dart';
import 'package:MyMedice/src/common_widgets/fade__in_animation/fade_in_animationcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TFadeInAnimation extends StatelessWidget {
   TFadeInAnimation({
    Key? key,
     required this.durationInMs, this.animatePosition, required this.child,
  }) : super(key: key);

  final  controller = Get.put(FadeInAnimationController());
  final int durationInMs;
   final TAnimatePosition? animatePosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration:  Duration(milliseconds: durationInMs),
       top: controller.animate.value ? animatePosition!.topAfter : animatePosition!.topBefore,
        left: controller.animate.value ? animatePosition!.tleftAfter : animatePosition!.tleftBefore,
        bottom: controller.animate.value ? animatePosition!.tbottomAfter : animatePosition!.tbottomBefore,
        right: controller.animate.value ? animatePosition!.trightAfter : animatePosition!.trightBefore,
        child: AnimatedOpacity(
          duration:  Duration(milliseconds: durationInMs),
          opacity: controller.animate.value ? 1 : 0,
          child: child,
        ),
      ),
    );
  }
}
