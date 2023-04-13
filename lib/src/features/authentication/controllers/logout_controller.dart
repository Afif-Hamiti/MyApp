import 'package:MyMedice/src/repository/authentication_repository/authentification_repository.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController {
  static LogoutController get instance => Get.find();

 void logout() {
    AuthenticationRepository.instance.logout();
  }

}
