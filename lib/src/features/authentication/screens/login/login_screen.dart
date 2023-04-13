import 'package:MyMedice/src/common_widgets/form/form_header_widget.dart';
import 'package:MyMedice/src/constants/image_strings.dart';
import 'package:MyMedice/src/constants/sizes.dart';
import 'package:MyMedice/src/constants/text_strings.dart';
import 'package:MyMedice/src/features/authentication/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_footer_widget.dart';
import 'login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    //Get the size in LoginHeaderWidget()
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tLoginTitle,
                  subTitle: tLoginSubTitle,
                ),
                LoginForm(),
                LoginFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
