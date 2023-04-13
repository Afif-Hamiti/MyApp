import 'package:MyMedice/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:MyMedice/src/features/core/controllers/main_pages_controller.dart';
import 'package:MyMedice/src/features/core/controllers/pages_controller.dart';
import 'package:MyMedice/src/repository/authentication_repository/authentification_repository.dart';
import 'package:MyMedice/src/utils/theme/them.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

RxBool? islogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  ClassBuilder.registerClasses();
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false.obs ;
  } else {
    islogin = true.obs;
  }
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: islogin == false.obs ? const SplashScreen() : const MainWidget(),
    );
  }
}
