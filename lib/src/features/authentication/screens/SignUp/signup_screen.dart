import 'package:MyMedice/src/common_widgets/form/form_header_widget.dart';
import 'package:MyMedice/src/constants/image_strings.dart';
import 'package:MyMedice/src/constants/sizes.dart';
import 'package:MyMedice/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'signup_footer_widget.dart';
import 'signup_form_widget.dart';

class SingnUpScreen extends StatelessWidget {
  const SingnUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: const[
                FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle,
                ),
                SignUpFormWidget(),
                SignUpFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

