import 'package:MyMedice/src/constants/colors.dart';
import 'package:MyMedice/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final obController = OnBoardingController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            enableLoop: false,
            pages: obController.pages,
            enableSideReveal: true,
            liquidController: obController.controller,
            onPageChangeCallback: (activePageIndex) {
              obController.onPageChangedCallback(activePageIndex);
              setState(() {
                isLastPage = activePageIndex == 2;
              });
            },
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            waveType: WaveType.circularReveal,
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () => obController.animateToNextSlide(),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
                onPrimary: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                    color: tDarkColor, shape: BoxShape.circle),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            // ignore: dead_code
            child: isLastPage
                ? TextButton(
                    onPressed: () async => obController.done(),
                    child: const Text("Done",
                        style: TextStyle(color: Colors.grey)),
                  )
                : TextButton(
                    onPressed: () => obController.skip(),
                    child: const Text("Skip",
                        style: TextStyle(color: Colors.grey)),
                  ),
          ),
          Obx(
            () => Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                count: 3,
                activeIndex: obController.currentPage.value,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Color(0xff272727),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
