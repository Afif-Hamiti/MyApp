import 'package:MyMedice/src/common_widgets/fade__in_animation/animation_design.dart';
import 'package:MyMedice/src/common_widgets/fade__in_animation/fade_in_animation_model.dart';
import 'package:MyMedice/src/common_widgets/fade__in_animation/fade_in_animationcontroller.dart';
import 'package:MyMedice/src/constants/image_strings.dart';
import 'package:MyMedice/src/constants/sizes.dart';
import 'package:MyMedice/src/constants/text_strings.dart';
import 'package:MyMedice/src/features/authentication/screens/SignUp/signup_screen.dart';
import 'package:MyMedice/src/features/authentication/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;

    return Scaffold(
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1200,
            animatePosition: TAnimatePosition(
                tbottomAfter: 0,
                tbottomBefore: -100,
                tleftAfter: 0,
                tleftBefore: 0,
                trightAfter: 0,
                trightBefore: 0),
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Lottie.asset(tWelcomeScreenImage, height: height * 0.66),
                  Column(
                    children: [
                      Text(tWelcomeTitle,
                          style: Theme.of(context).textTheme.headline3),
                      Text(tWelcomeSubTitle,
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Get.to(() => const LoginScreen()),
                          child: Text(tLogin.toUpperCase()),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => const SingnUpScreen()),
                          child: Text(tSignup.toUpperCase()),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
